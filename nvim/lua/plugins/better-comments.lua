-- ~/.config/nvim/lua/plugins/better-comments.lua
return {
  "Djancyp/better-comments.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "VeryLazy",
  config = function()
    local api = vim.api
    local ts = vim.treesitter

    local parsers_ok, parsers = pcall(require, "nvim-treesitter.parsers")
    local function has_parser(ft)
      if not ft or ft == "" then return false end
      if parsers_ok and type(parsers.has_parser) == "function" then
        return parsers.has_parser(ft)
      end
      local ok = pcall(ts.get_parser, 0, ft)
      return ok
    end

    local opts = {
      tags = {
        { name = "TODO",    fg = "white", bg = "#0a7aca", bold = true,  virtual_text = "" },
        { name = "FIX",     fg = "white", bg = "#f44747", bold = true,  virtual_text = " ← FIX" },
        { name = "WARNING", fg = "#FFA500", bg = "",      bold = false, virtual_text = " ← WARNING" },
        { name = "!",       fg = "#f44747", bg = "",      bold = true },
        { name = "*", fg = "#90EE90", bg = "", bold = false },
      },
    }

    -- namespace cache so we reuse the same namespace ids
    local ns_cache = {}
    local function ns_for(name)
      if ns_cache[name] then return ns_cache[name] end
      local id = api.nvim_create_namespace("better_comments_" .. name)
      ns_cache[name] = id
      return id
    end

    -- create highlight groups (and store the group name on the tag)
    local function create_hl(list)
      for id, hl in ipairs(list) do
        local group = "BetterCommentsTag" .. tostring(id)
        vim.api.nvim_set_hl(0, group, {
          fg = hl.fg ~= "" and hl.fg or nil,
          bg = hl.bg ~= "" and hl.bg or nil,
          bold = hl.bold,
          underline = hl.underline,
        })
        hl._group = group
      end
    end

    local function get_root(bufnr, ft)
      local ok, parser = pcall(ts.get_parser, bufnr, ft)
      if not ok or not parser then return nil end
      local ok2, tree = pcall(function() return parser:parse()[1] end)
      if not ok2 or not tree then return nil end
      return tree:root()
    end

    local function clear_all_namespaces(buf)
      for _, tag in ipairs(opts.tags) do
        local ns = ns_for(tag.name)
        api.nvim_buf_clear_namespace(buf, ns, 0, -1)
      end
    end

    -- Treesitter-based highlighter (returns true if it highlighted anything)
    local function highlight_with_ts(buf, ft)
      if not has_parser(ft) then return false end

      local okq, query = pcall(ts.query.parse, ft, "(comment) @all")
      if not okq or not query then return false end

      local root = get_root(buf, ft)
      if not root then return false end

      local comments = {}
      for _, node in query:iter_captures(root, buf, 0, -1) do
        local range = { node:range() }
        table.insert(comments, {
          line = range[1],
          col_start = range[2],
          finish = range[4],
          text = ts.get_node_text(node, buf),
        })
      end

      if #comments == 0 then return false end

      create_hl(opts.tags)
      for id, comment in ipairs(comments) do
        for hl_id, hl in ipairs(opts.tags) do
          if type(comment.text) == "string" and string.find(comment.text, hl.name, 1, true) then
            local ns = ns_for(hl.name)

            if hl.virtual_text and hl.virtual_text ~= "" then
              api.nvim_buf_set_extmark(buf, ns, comment.line, 0, {
                id = (id * 1000) + hl_id,
                virt_text = { { hl.virtual_text, hl._group } },
                virt_text_pos = "eol",
              })
            end

            api.nvim_buf_add_highlight(buf, ns, hl._group, comment.line, comment.col_start, comment.finish)
          end
        end
      end

      return true
    end

    -- Fallback for any filetype (incl. those without Treesitter, e.g. .conf)
    local function highlight_with_fallback(buf)
      if not api.nvim_buf_is_loaded(buf) then return false end

      local function trim(s)
        return (s:gsub("^%s+", "")), (#s - #s:gsub("^%s+", ""))
      end

      -- Try to derive a line comment leader from 'commentstring'
      local cs = api.nvim_buf_get_option(buf, "commentstring") or ""
      local leader = ""
      if cs:find("%%s", 1, true) then
        leader = cs:sub(1, cs:find("%%s", 1, true) - 1)
        leader = leader:gsub("%s+$", "")
      end

      -- Common line comment leaders as safety net (covers .conf: "#", ";")
      local leaders = {}
      local seen = {}
      local function add_leader(l)
        if l and l ~= "" and not seen[l] then leaders[#leaders + 1] = l; seen[l] = true end
      end
      add_leader(leader)
      add_leader("#")
      add_leader(";")
      add_leader("//")
      add_leader("--")
      add_leader("%")   -- e.g. TeX
      add_leader('"')   -- e.g. Vimscript

      local line_count = api.nvim_buf_line_count(buf)
      local found_any = false
      create_hl(opts.tags)

      for lnum = 0, line_count - 1 do
        local line = api.nvim_buf_get_lines(buf, lnum, lnum + 1, false)[1] or ""
        local trimmed, indent = trim(line)
        local used_leader, comment_col = nil, nil

        for _, ldr in ipairs(leaders) do
          if ldr ~= "" and trimmed:sub(1, #ldr) == ldr then
            used_leader = ldr
            comment_col = indent -- highlight whole comment from its leader
            break
          end
        end

        if used_leader then
          for hl_id, hl in ipairs(opts.tags) do
            if trimmed:find(hl.name, 1, true) then
              found_any = true
              local ns = ns_for(hl.name)

              if hl.virtual_text and hl.virtual_text ~= "" then
                api.nvim_buf_set_extmark(buf, ns, lnum, 0, {
                  id = (lnum + 1) * 1000 + hl_id,
                  virt_text = { { hl.virtual_text, hl._group } },
                  virt_text_pos = "eol",
                })
              end

              -- Highlight from the start of the comment leader to end-of-line
              api.nvim_buf_add_highlight(buf, ns, hl._group, lnum, comment_col, -1)
            end
          end
        end
      end

      return found_any
    end

    local function highlight_buffer(buf)
      if not api.nvim_buf_is_loaded(buf) then return end

      -- clear previous extmarks/highlights for our namespaces
      clear_all_namespaces(buf)

      local ft = api.nvim_buf_get_option(buf, "filetype")
      local ok_ts = false
      local ok, err = pcall(function()
        ok_ts = highlight_with_ts(buf, ft)
      end)
      if not ok then
        vim.schedule(function()
          vim.notify("better-comments(ts): " .. tostring(err), vim.log.levels.DEBUG)
        end)
      end

      if not ok_ts then
        local ok_fb, err_fb = pcall(function()
          highlight_with_fallback(buf)
        end)
        if not ok_fb then
          vim.schedule(function()
            vim.notify("better-comments(fallback): " .. tostring(err_fb), vim.log.levels.DEBUG)
          end)
        end
      end
    end

    -- autocmd that refreshes highlights for the current buffer
    local aug = api.nvim_create_augroup("better_comments_lazygit", { clear = true })
    api.nvim_create_autocmd({ "BufWinEnter", "BufFilePost", "BufWritePost", "TextChanged", "TextChangedI", "InsertLeave" }, {
      group = aug,
      callback = function()
        local buf = api.nvim_get_current_buf()
        local name = api.nvim_buf_get_name(buf)
        if name == "" then return end
        local ok, _ = pcall(highlight_buffer, buf)
        if not ok then
          vim.schedule(function()
            vim.notify("better-comments: highlight failed for buffer " .. name, vim.log.levels.DEBUG)
          end)
        end
      end,
    })

    -- run once on load for current buffer
    pcall(function() highlight_buffer(api.nvim_get_current_buf()) end)
  end,
}
