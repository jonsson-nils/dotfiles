return {
  { "folke/persistence.nvim", cmd = "RestoreSession" },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
      require("persistence").setup({
        dir = vim.fn.stdpath("data") .. "/sessions/",
        options = { "buffers", "curdir", "tabpages", "winsize" },
        need = 1,
        branch = true,
      })
    end,
  },
}
