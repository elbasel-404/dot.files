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
      -- fallback: try to get parser
      local ok = pcall(ts.get_parser, 0, ft)
      return ok
    end

    local opts = {
      tags = {
        { name = "TODO",    fg = "white", bg = "#0a7aca", bold = true,  virtual_text = "" },
        { name = "FIX",     fg = "white", bg = "#f44747", bold = true,  virtual_text = " ← FIX" },
        { name = "WARNING", fg = "#FFA500", bg = "",      bold = false, virtual_text = " ← WARNING" },
        { name = "!",       fg = "#f44747", bg = "",      bold = true },
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

    local function highlight_buffer(buf)
      if not api.nvim_buf_is_loaded(buf) then return end
      local ft = api.nvim_buf_get_option(buf, "filetype")
      if not has_parser(ft) then return end

      local okq, query = pcall(ts.query.parse, ft, "(comment) @all")
      if not okq or not query then return end

      local root = get_root(buf, ft)
      if not root then return end

      -- collect comments
      local comments = {}
      for _, node in query:iter_captures(root, buf, 0, -1) do
        -- node:range() -> start_row, start_col, end_row, end_col
        local range = { node:range() }
        table.insert(comments, {
          line = range[1],
          col_start = range[2],
          finish = range[4],
          text = ts.get_node_text(node, buf),
        })
      end

      -- clear previous extmarks/highlights for our namespaces
      for _, tag in ipairs(opts.tags) do
        local ns = ns_for(tag.name)
        api.nvim_buf_clear_namespace(buf, ns, 0, -1)
      end

      if #comments == 0 then return end
      create_hl(opts.tags)

      for id, comment in ipairs(comments) do
        for hl_id, hl in ipairs(opts.tags) do
          if type(comment.text) == "string" and string.find(comment.text, hl.name) then
            local ns = ns_for(hl.name)

            -- virtual text: use eol for stability
            if hl.virtual_text and hl.virtual_text ~= "" then
              api.nvim_buf_set_extmark(buf, ns, comment.line, 0, {
                id = (id * 1000) + hl_id,
                virt_text = { { hl.virtual_text, hl._group } },
                virt_text_pos = "eol",
              })
            end

            -- add highlight using the group created earlier
            api.nvim_buf_add_highlight(buf, ns, hl._group, comment.line,
              comment.col_start, comment.finish)
          end
        end
      end
    end

    -- autocmd that refreshes highlights for the current buffer
    local aug = api.nvim_create_augroup("better_comments_lazygit", { clear = true })
    api.nvim_create_autocmd({ "BufWinEnter", "BufFilePost", "BufWritePost", "TextChanged", "TextChangedI", "InsertLeave" }, {
      group = aug,
      callback = function()
        local buf = api.nvim_get_current_buf()
        -- safe protect: don't spam on ephemeral buffers
        local name = api.nvim_buf_get_name(buf)
        if name == "" then return end
        local ok, _ = pcall(highlight_buffer, buf)
        if not ok then
          -- don't spam notifications, but record an entry in :messages for debugging
          vim.schedule(function()
            vim.notify("better-comments: treesitter query failed for buffer " .. name, vim.log.levels.DEBUG)
          end)
        end
      end,
    })

    -- optional: run once on load for current buffer
    pcall(function() highlight_buffer(api.nvim_get_current_buf()) end)
  end,
}

