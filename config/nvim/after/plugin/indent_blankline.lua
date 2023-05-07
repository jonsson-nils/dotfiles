require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable indent-blankline for dashboard',
  pattern = '*',
  group = vim.api.nvim_create_augroup('enable_indent_blankline', {clear = true}),
  callback = function(_)
    vim.cmd[[:IndentBlanklineEnable]]
    vim.opt.colorcolumn = '80'
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Disable indent-blankline for dashboard',
  pattern = 'startup',
  group = vim.api.nvim_create_augroup('disable_indent_blankline', {clear = true}),
  callback = function(_)
    vim.cmd[[:IndentBlanklineDisable]]
    vim.opt.colorcolumn = {}
  end,
})

