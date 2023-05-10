vim.g.mapleader = " "

require('user.options')
require('user.keymaps')
require('user.packer')

local window = nil
local bufnr = nil

local function ensure_window()
  if window == nil or not (vim.api.nvim_win_is_valid(window)) then
    vim.cmd [[split]]
    vim.cmd [[wincmd j]]
    window = vim.api.nvim_get_current_win()
    vim.cmd [[wincmd k]]
  end
  if bufnr == nil or not (vim.api.nvim_win_is_valid(window)) then
    bufnr = vim.api.nvim_create_buf(false, true)
  end
  vim.api.nvim_win_set_buf(window, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(bufnr, 'filetype', 'logs')
end

local updating = false
vim.keymap.set('n', '<leader>/source', function()
  if (updating) then
    print('reload is in progress')
    return
  end
  updating = true
  print('reloading configuration')

  ensure_window()
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {})
  vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, { '$ home-manager switch' })

  vim.fn.jobstart('home-manager switch', {
    stdout_buffered = true,
    on_exit = function(_, code)
      vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, { 'exit code: ' .. code })
      updating = false
      if (code ~= 0) then
        error('failed to update')
        return
      end
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
