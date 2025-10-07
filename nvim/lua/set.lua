-- See highlight on search
vim.opt.hlsearch       = true

-- -- Transparent background
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Set cursor
vim.opt.guicursor      = ""

-- Set number column
vim.opt.number         = true

-- Set relative number navigation
vim.opt.relativenumber = true

-- Set tabstop definitions
vim.opt.tabstop        = 2
vim.opt.softtabstop    = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true

-- Unset line wrap
vim.opt.wrap           = false

-- Disable vim backup but enable undotree long term backup
vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile       = true

-- Nice colors
vim.opt.termguicolors  = true

-- Set mouse integration
vim.opt.mouse          = 'a'
--vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.opt.clipboard      = 'unnamedplus'

-- Save undo history
vim.opt.undofile       = true

-- Case-insensitive searching UNLESS \C or more capital letters in the search term
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

-- Decrease update time
vim.opt.updatetime     = 250

-- Delimitate width keepcoding
vim.opt.colorcolumn    = "80"

-- Indentation
vim.opt.smartindent    = true

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen     = 300

-- Configure how new splits should be opened
vim.opt.splitright     = true
vim.opt.splitbelow     = true

-- Preview substitutions live, as you type!
vim.opt.inccommand     = 'split'

-- Show which line and column your cursor is on
vim.opt.cursorline     = true
vim.opt.cursorcolumn   = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff      = 10
