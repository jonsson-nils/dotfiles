require("persistence").setup()

-- restore the session for the current directory
vim.keymap.set("n", "<leader>qq", [[<cmd>lua require("persistence").load()<cr>]], {})

-- restore the last session
--vim.keymap.set("n", "<leader>qq", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qx", [[<cmd>lua require("persistence").stop()<cr>]], {})

