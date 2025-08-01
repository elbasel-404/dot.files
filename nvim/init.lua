vim.g.mapleader = "`"

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>y", '"+yy', { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<leader>z", "<Plug>(copilot-suggest)", { noremap = true, silent = true })
vim.keymap.set('n', '<C-L>', '<Plug>(copilot-suggest)')


-- Set nowrap
vim.o.wrap = false

-- require("settings")
-- require("keymaps")
require("plugins")
-- require("lsp")


