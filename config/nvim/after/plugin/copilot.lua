vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-u>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

