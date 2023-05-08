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
vim.keymap.set("n", "<leader>nf", function()
  vim.cmd [[Neotree reveal]]
end)
vim.keymap.set("n", "<leader>ng", function()
  vim.cmd [[Neotree git_status git_base=main reveal]]
end)
vim.keymap.set("n", "<leader>nb", function()
  vim.cmd [[Neotree buffers reveal]]
end)

