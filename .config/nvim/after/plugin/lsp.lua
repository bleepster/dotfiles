local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
  'pyright',
})

lsp.set_preferences({
  sign_icons = { }
})

lsp.setup()

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>ds', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.keymap.set('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.keymap.set('n', '<leader>dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
