vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1d1e29' })

require 'octo'.setup({
  default_remote = { 'upstream', 'origin' }, -- order to try remotes
  ssh_aliases = {},                        -- SSH aliases. e.g. `ssh_aliases = {['github.com-work'] = 'github.com'}`
  reaction_viewer_hint_icon = '',       -- marker for user reactions
  user_icon = ' ',                      -- user icon
  timeline_marker = '',                 -- timeline marker
  timeline_indent = '2',                   -- timeline indentation
  right_bubble_delimiter = '',          -- bubble delimiter
  left_bubble_delimiter = '',           -- bubble delimiter
  github_hostname = '',                    -- GitHub Enterprise host
  snippet_context_lines = 4,               -- number or lines around commented lines
  gh_env = {},                             -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
  timeout = 5000,                          -- timeout for requests between the remote server
  ui = {
    use_signcolumn = true,                 -- show 'modified' marks on the sign column
  },
  issues = {
    order_by = {
                            -- criteria to sort results of `Octo issue list`
      field = 'CREATED_AT', -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction =
      'DESC'                -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    }
  },
  pull_requests = {
    order_by = {
                                             -- criteria to sort the results of `Octo pr list`
      field = 'CREATED_AT',                  -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction =
      'DESC'                                 -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    },
    always_select_remote_on_create = 'false' -- always give prompt to select base remote repo when creating PRs
  },
  file_panel = {
    size = 10,       -- changed files panel rows
    use_icons = true -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
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
