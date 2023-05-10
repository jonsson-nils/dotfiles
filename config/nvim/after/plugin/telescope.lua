local telescope = require('telescope')
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "follow",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = true,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    color_devicons = true,
  },
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
vim.keymap.set('n', '<leader>tt', function() builtin.builtin({include_extensions=true}) end, {})
-- todo: builtin.pickers does not appear to open the actual selection
--vim.keymap.set('n', '<leader>t,', builtin.pickers, {})
vim.keymap.set('n', '<leader>t.', builtin.resume, {})
vim.keymap.set('n', '<leader>ts', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>t?', builtin.help_tags, {})
vim.keymap.set('n', '<leader>t/', builtin.commands, {})
vim.keymap.set('n', '<leader>t\\', builtin.keymaps, {})
vim.keymap.set('n', '<leader>tS', function()
  builtin.grep_string({ search = vim.fn.input("grep > ") })
end)
