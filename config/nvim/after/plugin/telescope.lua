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
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ta', builtin.find_files, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>t?', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ts', function()
  builtin.grep_string({ search = vim.fn.input("grep > ") })
end)
vim.api.nvim_set_keymap(
	"v",
	"<leader>tr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)
vim.keymap.set('n', '<leader>two', telescope.extensions.git_worktree.git_worktrees)
vim.keymap.set('n', '<leader>twc', telescope.extensions.git_worktree.create_git_worktree)

