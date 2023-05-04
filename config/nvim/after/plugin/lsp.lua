local lsp = require("lsp-zero")

lsp.preset("recommended")
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
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  --['<C-d>'] = cmp.mapping.
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
})
lsp.set_preferences({
  sign_icons = { }
})

local on_attach = function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end)
  vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
  vim.keymap.set("n", "<leader>ch", function() vim.lsp.buf.hover() end)
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

