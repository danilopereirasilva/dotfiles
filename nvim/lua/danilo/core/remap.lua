vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "

-- Standards
-- vim.keymap.set("n", "<leader>e", ':Ex <CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>qa', ':qa <CR>', { desc = 'Quit Neovim' })
vim.keymap.set('n', '<leader>qq', ':q <CR>', { desc = 'Close window?' })
vim.keymap.set('n', '<leader>w', ':w <CR>', { desc = 'Save buffer' })
vim.keymap.set('n', '<leader>x', '<cmd>BufferClose<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>xo', '<cmd>BufferCloseAllButCurrent<CR>', { desc = 'Close other buffers' })
vim.keymap.set('n', '<leader>xr', '<cmd>BufferRestore<CR>', { desc = 'Restore last closed buffer' })

-- Splits
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal sizes' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Make splits equal sizes' })

--Tabs
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })


-- Buffer navigation
vim.keymap.set('n', 'H', '<cmd>BufferPrevious<CR>')
vim.keymap.set('n', 'L', '<cmd>BufferNext<CR>')

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

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = 'Undotree' })
