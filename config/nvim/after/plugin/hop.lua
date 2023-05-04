local hop = require('hop')

hop.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.keymap.set('n', '<leader>hh', hop.hint_words)

