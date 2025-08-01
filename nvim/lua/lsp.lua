-- local lspconfig = require("lspconfig")

-- -- Common on_attach function
-- local on_attach = function(client, bufnr)
--   -- Format on save
--   if client.server_capabilities.documentFormattingProvider then
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = bufnr,
--       callback = function()
--         vim.lsp.buf.format({ async = false })
--       end,
--     })
--   end
-- end

-- -- TypeScript
-- lspconfig.ts_ls.setup({
--   on_attach = on_attach,
-- })

-- -- ESLint
-- lspconfig.eslint.setup({
--   on_attach = on_attach,
-- })

-- -- Tailwind CSS
-- lspconfig.tailwindcss.setup({
--   on_attach = on_attach,
-- })

