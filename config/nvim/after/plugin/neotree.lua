vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("neo-tree").setup({
  enable_diagnostics = true,
  filesystem = {
    hijack_netrw_behavior = "open_current",
  },
  source_selector = {
    winbar = false,
    statusline = false
  },
  event_handlers = {
    {
      event = 'file_opened',
      handler = function(_)
        require('neo-tree').close_all()
      end
    },
  }
})
vim.keymap.set("n", "<leader>nf", [[:Neotree reveal<cr>]])
vim.keymap.set("n", "<leader>ng", [[:Neotree git_status git_base=main reveal<cr>]])
vim.keymap.set("n", "<leader>nb", [[:Neotree buffers reveal<cr>]])

