require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Disable indent-blankline for dashboard',
  pattern = 'dashboard',
  group = vim.api.nvim_create_augroup('disable_indent_blankline', {clear = true}),
  callback = function(_)
    vim.cmd[[:IndentBlanklineDisable]]
  end,
})

