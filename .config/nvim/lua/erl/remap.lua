vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- supposed to yank stuff to clipboard, NOT WORKING
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")
-- vim.keymap.set("v", "<leader>y", "\"+y")

-- buffer remaps
vim.keymap.set("n", "<leader><Right>", ":bn<CR>")
vim.keymap.set("n", "<leader><Left>", ":bp<CR>")

-- telescope remaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

-- diagnostic remaps
-- from: https://smarttech101.com/nvim-lsp-diagnostics-keybindings-signs-virtual-texts/
vim.api.nvim_set_keymap('n', '<leader>df', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
