vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("neo-tree").setup({
  enable_diagnostics = true,
  filesystem = {
    hijack_netrw_behavior = "open_current",
  },
  source_selector = {
    winbar = false,
    statusline = false
  }
})
vim.keymap.set("n", "<leader>tt", [[:Neotree reveal<cr>]])
vim.keymap.set("n", "<leader>tg", [[:Neotree git_status git_base=main reveal<cr>]])
vim.keymap.set("n", "<leader>tb", [[:Neotree buffers reveal<cr>]])

