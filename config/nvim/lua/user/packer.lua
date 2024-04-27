local ensure_packer = function()
  local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'folke/zen-mode.nvim'
  use 'folke/twilight.nvim'
  use 'folke/which-key.nvim'
  use 'preservim/nerdcommenter'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-treesitter/playground'
  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use { 'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'VimEnter',
    config = function()
      require('copilot').setup({
        panel = {
          enabled = true,
          auto_refresh = false,
        },
        layout = {
          position = 'right',
          ratio = 0.5,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<right>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<left>",
          },
        },
      })
    end,
  }
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'simrat39/symbols-outline.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '*',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  -- TODO: fix me
  --use {
    --'akinsho/bufferline.nvim',
    --tag = '*',
    --requires = 'nvim-tree/nvim-web-devicons',
  --}
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    }
  }
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use 'ggandor/leap.nvim'
  use 'ggandor/flit.nvim'
  use 'tpope/vim-repeat'

  use({
    'kylechui/nvim-surround',
    tag = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require('nvim-surround').setup({})
    end
  })
  use { 'ThePrimeagen/git-worktree.nvim',
    config = function()
      require('git-worktree').setup({
        update_on_change = true,
        clearjumps_on_change = true,
        autopush = true,
        autopull = true,
        disable_commands = false,
      })
      vim.keymap.set('n', '<leader>two', require('telescope').extensions.git_worktree.git_worktrees)
      vim.keymap.set('n', '<leader>twc', require('telescope').extensions.git_worktree.create_git_worktree)
    end
  }
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    setup = function()
    end,
    ft = { 'markdown' },
  }
  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
  }
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use({
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    module = 'persistence',
  })
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt', 'vim' },
      })
    end,
  }
  use {
    'startup-nvim/startup.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      require 'startup'.setup({ theme = 'evil' })
    end
  }

  use {
    'petertriho/nvim-scrollbar',
    config = function()
      require('scrollbar').setup()
    end,
  }
  use {
    "someone-stole-my-name/yaml-companion.nvim",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
      local cfg = require("yaml-companion").setup({})
      require("lspconfig")["yamlls"].setup(cfg)
    end,
  }
  use {
    'kdheepak/tabline.nvim',
    config = function()
      require'tabline'.setup {
        -- Defaults configuration options
        enable = true,
        options = {
        -- If lualine is installed tabline will use separators configured in lualine by default.
        -- These options can be used to override those settings.
          section_separators = {'', ''},
          component_separators = {'', ''},
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = false, -- this appends [bufnr] to buffer section,
          show_filename_only = false, -- shows base filename only instead of relative path in filename
          modified_icon = "+ ", -- change the default modified icon
          modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
        }
      }
      vim.cmd[[
        set guioptions-=e " Use showtabline in gui vim
        set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
    end,
    requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
  }

  -- todo: checkout these plugins
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  -- https://github.com/desdic/agrolens.nvim
  -- https://github.com/tpope/vim-dadbod
  -- todo: take a look at httpie

  vim.keymap.set('n', '<leader>/ps', require('packer').sync, { noremap = true, silent = true })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
