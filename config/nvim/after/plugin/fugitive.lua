vim.keymap.set("n", "<leader>gs", [[:tab Git<cr>]])
vim.keymap.set("n", "<leader>gd", [[:tab Git diff<cr>]])
vim.keymap.set("n", "<leader>gc", [[:tab Git commit<cr>]])
vim.keymap.set("n", "<leader>gp", [[:Git push<cr>]])
vim.keymap.set("n", "<leader>gl", [[:Git pull<cr>]])
vim.keymap.set("n", "<leader>gr", vim.cmd.Gread)
vim.keymap.set("n", "<leader>gw", vim.cmd.Gwrite)
vim.keymap.set("n", "<leader>gR", [[:GRemove<cr>]])
vim.keymap.set('n', '<leader>gbc', function()
  local name = vim.fn.input('new branch > ')
  vim.cmd('Git branch ' .. name)
end)
vim.keymap.set('n', '<leader>gbs', function()
  local name = vim.fn.input('switch branch > ')
  vim.cmd('Git switch ' .. name)
end)
vim.keymap.set('n', '<leader>gbd', function()
  local name = vim.fn.input('delete branch > ')
  vim.cmd('Git branch -d ' .. name)
end)
vim.keymap.set('n', '<leader>gbl', function()
end)

