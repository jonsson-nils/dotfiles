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
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', function()
  builtin.grep_string({ search = vim.fn.input("grep > ") })
end)
vim.api.nvim_set_keymap(
	"v",
	"<leader>fr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)
vim.keymap.set('n', '<leader>fwo', telescope.extensions.git_worktree.git_worktrees)
vim.keymap.set('n', '<leader>fwc', telescope.extensions.git_worktree.create_git_worktree)

