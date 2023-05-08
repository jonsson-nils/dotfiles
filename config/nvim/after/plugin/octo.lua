vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1d1e29' })

require 'octo'.setup({
  default_remote = { 'upstream', 'origin' },
  reaction_viewer_hint_icon = '',
  user_icon = ' ',
  timeline_marker = '',
  timeline_indent = '2',
  right_bubble_delimiter = '',
  left_bubble_delimiter = '',
  snippet_context_lines = 4,
  gh_env = {},
  timeout = 5000,
  ui = {
    use_signcolumn = true,
  },
  issues = {
    order_by = {
      field = 'CREATED_AT',
      direction = 'DESC',
    }
  },
  pull_requests = {
    order_by = {
      field = 'CREATED_AT',
      direction = 'DESC',
    },
    always_select_remote_on_create = false
  },
  file_panel = {
    size = 10,
    use_icons = true
  },
})

vim.keymap.set('n', '<leader>oil', '<cmd>Octo issue list<cr>')
vim.keymap.set('n', '<leader>ois', '<cmd>Octo issue search<cr>')
vim.keymap.set('n', '<leader>oic', '<cmd>Octo issue create<cr>')
vim.keymap.set('n', '<leader>oix', '<cmd>Octo issue close<cr>')
vim.keymap.set('n', '<leader>oir', '<cmd>Octo issue reopen<cr>')
vim.keymap.set('n', '<leader>opl', '<cmd>Octo pr list<cr>')
vim.keymap.set('n', '<leader>opc', '<cmd>Octo pr create<cr>')
vim.keymap.set('n', '<leader>opx', '<cmd>Octo pr close<cr>')
vim.keymap.set('n', '<leader>opr', '<cmd>Octo pr reopen<cr>')
vim.keymap.set('n', '<leader>opm', '<cmd>Octo pr merge<cr>')
vim.keymap.set('n', '<leader>opd', '<cmd>Octo pr diff<cr>')
vim.keymap.set('n', '<leader>opb', '<cmd>Octo pr checkout<cr>')
vim.keymap.set('n', '<leader>opv', '<cmd>Octo pr review<cr>')
vim.keymap.set('n', '<leader>to', '<cmd>Octo actions<cr>')
