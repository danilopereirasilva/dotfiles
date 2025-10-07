vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ':Ex <CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>qq', ':q <CR>')
vim.keymap.set('n', '<leader>w', ':w <CR>')
vim.keymap.set('n', '<leader>x', ':bd <CR>')

-- Buffer navigation
vim.keymap.set('n', 'H', ':bprev <CR>')
vim.keymap.set('n', 'L', ':bnext <CR>')

-- Moves selected line up (J) and down (K)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Changes the content of paste
vim.keymap.set("x", "<leader>p", "\"_dP")

-- >>>>>>>>Rename every variable at the same time<<<<<<<<<
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>se', vim.diagnostic.open_float, { desc = '[S]how diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
