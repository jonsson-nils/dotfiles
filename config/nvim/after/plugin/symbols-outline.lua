require('symbols-outline').setup()
vim.keymap.set("n", "<leader>et", [[:SymbolsOutline<cr>]],  { silent = true, noremap = true })
vim.keymap.set("n", "<leader>eo", [[:SymbolsOutlineOpen<cr>]],  { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ec", [[:SymbolsOutlineClose<cr>]],  { silent = true, noremap = true })

