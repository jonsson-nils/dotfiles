require("zen-mode").setup {
  window = {
    backdrop = 0.95,
    width = 120,
    height = 1,
    options = {
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
    },
    twilight = { enabled = false },
    gitsigns = { enabled = false },
    tmux = { enabled = false },
    alacritty = {
      enabled = false,
      font = "14",
    },
  },

  on_open = function(_)
  end,

  on_close = function()
  end,
}

vim.keymap.set('n', '<leader>zz', function()
  vim.cmd [[ZenMode]]
end)
