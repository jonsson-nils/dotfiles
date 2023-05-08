-- disable bad things
vim.keymap.set("n", "Q", "<nop>")

-- system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
--vim.keymap.set("n", "<leader>d", "\"_d")
--vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("x", "<leader>p", "\"_dP")

-- todo: finish this
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod u+x %<CR>", { silent = true })

-- window management
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>wv", "<C-w>v")
vim.keymap.set("n", "<leader>wq", "<C-w>q")
vim.keymap.set('n', '<leader>ww', '<C-w>w')
vim.keymap.set('n', '<leader>wx', '<C-w>x')
vim.keymap.set("n", "<leader>w=", "<C-w>=")

-- buffer managment
vim.keymap.set('n', '<leader>mq', function()
  vim.cmd('bdelete ' .. vim.fn.bufnr())
end)
vim.keymap.set('n', '<leader>mw', function()
  vim.cmd [[w]]
end)
vim.keymap.set('n', '<leader>mx', function()
  vim.cmd [[w]]
  vim.cmd('bdelete ' .. vim.fn.bufnr())
end)
vim.keymap.set('n', '<leader>mk', function()
  vim.cmd [[bnext]]
end)
vim.keymap.set('n', '<leader>mj', function()
  vim.cmd [[bprevious]]
end)

-- navigation
--vim.keymap.set('n', 'j', 'jzz', { noremap = true, silent = true })
--vim.keymap.set('v', 'j', 'jzz', { noremap = true, silent = true })
--vim.keymap.set('n', 'k', 'kzz', { noremap = true, silent = true })
--vim.keymap.set('v', 'k', 'kzz', { noremap = true, silent = true })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "gs", "^")
vim.keymap.set("v", "gs", "^")
vim.keymap.set("n", "gl", "$")
vim.keymap.set("v", "gl", "$")
vim.keymap.set("n", "gh", "0")
vim.keymap.set("v", "gh", "0")
vim.keymap.set("n", "ge", "Gzz")
vim.keymap.set("v", "ge", "Gzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--vim.keymap.set("n", "<leader><leader>", function()
--  vim.cmd("so")
--end)
--

vim.keymap.set('n', '<leader>/exit', function()
  vim.cmd [[qa]]
end)
