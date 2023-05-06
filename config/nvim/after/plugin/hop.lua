local hop = require('hop')

hop.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.keymap.set('n', '<leader>jj', hop.hint_words)
vim.keymap.set('v', '<leader>jj', hop.hint_words)

