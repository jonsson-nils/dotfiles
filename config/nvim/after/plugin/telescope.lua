local telescope = require('telescope')
require('telescope').setup {
  extensions = {
    ['ui-select'] = {
      require("telescope.themes").get_dropdown {
      }
    }
  }
}

telescope.load_extension('ui-select')
telescope.load_extension("refactoring")
telescope.load_extension("git_worktree")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ts', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>t?', builtin.help_tags, {})
vim.keymap.set('n', '<leader>tS', function()
  builtin.grep_string({ search = vim.fn.input("grep > ") })
end)
