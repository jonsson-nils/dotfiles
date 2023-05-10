local lsp = require("lsp-zero")

lsp.preset({})
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'nil_ls',
  'dockerls',
  'docker_compose_language_service',
  'jsonls',
  'marksman',
  'sqlls',
  'yamlls',
  'terraformls',
  'texlab',
})

lsp.set_preferences({
  sign_icons = {
    error = " ",
    warn = " ",
    hint = " ",
    info = " "
  },
})

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end)
  vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>.f", function() vim.lsp.buf.format() end)
  vim.keymap.set("n", "<leader>.a", function() vim.lsp.buf.code_action() end)
  vim.keymap.set("n", "<leader>.h", function() vim.lsp.buf.hover() end)
  vim.keymap.set("n", "<leader>s", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

lsp.configure('rust_analyzer', {
  on_attach = on_attach,
  settings = {
    ["rust_analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    }
  }
})

lsp.on_attach(on_attach)
lsp.setup()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  performance = {
    trigger_debounce_time = 200,
    throttle = 250,
    fetching_timeout = 500,
  },
  mapping = {
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    documentation = {
      max_height = 15,
      max_width = 60,
    }
  },
  formatting = {
    fields = { 'abbr', 'menu', 'kind' },
    format = function(entry, item)
      local short_name = {
        nvim_lsp = 'LSP',
        nvim_lua = 'nvim'
      }

      local menu_name = short_name[entry.source.name] or entry.source.name

      item.menu = string.format('[%s]', menu_name)
      return item
    end,
  },
})
