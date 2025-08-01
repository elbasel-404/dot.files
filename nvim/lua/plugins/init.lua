-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin setup
require("lazy").setup({
  -- LSP and Mason
  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     "williamboman/mason-lspconfig.nvim",
  --   },
  --   config = function()
  --     require("mason").setup()
  --     require("mason-lspconfig").setup({
  --       ensure_installed = { "ts_ls", "eslint", "tailwindcss" },
  --     })
  --   end,
  -- },
  
  -- Autocompletion
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "L3MON4D3/LuaSnip",
  --   },
  --   config = function()
  --     local cmp = require("cmp")
  --     cmp.setup({
  --       snippet = {
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<C-e>"] = cmp.mapping.abort(),
  --         ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "nvim_lsp" },
  --         { name = "buffer" },
  --       }),
  --     })
  --   end,
  -- },
  
  -- Treesitter
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       ensure_installed = { "tsx", "typescript", "javascript", "html", "css", "lua" },
  --       highlight = { enable = true },
  --       indent = { enable = true },
  --     })
  --   end,
  -- },
  
  -- Tailwind CSS colorizer
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   config = function()
  --     require("colorizer").setup({
  --       user_default_options = {
  --         tailwind = true,
  --       },
  --     })
  --   end,
  -- },
  
  -- Status line
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = { "kyazdani42/nvim-web-devicons" },
  --   config = function()
  --     require("lualine").setup({
  --       options = {
  --         theme = "auto",
  --         section_separators = { left = "", right = "" },
  --         component_separators = { left = "", right = "" },
  --       },
  --     })
  --   end,
  -- },
  
  -- File explorer
  -- {
  --   "kyazdani42/nvim-tree.lua",
  --   dependencies = { "kyazdani42/nvim-web-devicons" },
  --   config = function()
  --     require("nvim-tree").setup()
  --   end,
  -- },
  
  -- Telescope
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  -- },
  
  -- Git signs
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   config = function()
  --     require("gitsigns").setup()
  --   end,
  -- },
  
  -- Transparent background
  -- {
  --   "xiyaowong/transparent.nvim",
  --   config = function()
  --     require("transparent").setup({
  --       enable = true,
  --       extra_groups = {
  --         "NormalFloat", "NvimTreeNormal", "NormalNC", "TelescopeNormal",
  --         "TelescopeBorder", "TelescopePromptNormal", "TelescopePromptBorder",
  --         "TelescopePromptTitle", "TelescopePreviewTitle", "TelescopeResultsTitle",
  --       },
  --       exclude_groups = {},
  --     })
  --   end,
  -- },
  
  -- Tokyo Night theme
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        transparent = true,
        -- You can add other options here as needed
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },
  
  -- Copilot
  {
    "github/copilot.vim",
    config = function()
      -- Optional: You can add Copilot-specific configuration here if needed
    end,
  },
})
