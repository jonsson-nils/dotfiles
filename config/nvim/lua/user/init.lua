vim.g.mapleader = " "

require('user.options')
require('user.keymaps')
require('user.packer')



local updating = false
vim.keymap.set('n', '<leader>/source', function()
  if (updating) then
    print('reload is in progress')
    return
  end
  updating = true
  print('reloading configuration')
  --local bufnr = vim.api.nvim_create_buf(false, true)
  --vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
  --vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')
  local bufnr = 452
  vim.api.nvim_buf_set_option(bufnr, 'filetype', 'logs')
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {})

  vim.fn.jobstart('home-manager switch', {
    stdout_buffered = true,
    on_exit = function(_, code)
      vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, {'exit code: ' .. code})
      updating = false
      if (code ~= 0) then
        error('failed to update')
        return
      end
      vim.cmd [[luafile %]]
      print('configuration reloaded')
    end,
    on_stdout = function(_, data)
      vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
    end,
    on_stderr = function(_, data)
      vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
    end
  })
end)
