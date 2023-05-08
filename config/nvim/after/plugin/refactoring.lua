require('refactoring').setup({})

vim.keymap.set("v", "<leader>tr", require('telescope').extensions.refactoring.refactors)
