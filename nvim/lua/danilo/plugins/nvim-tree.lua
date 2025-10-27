return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require('nvim-tree').setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 40,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      git = {
        ignore = false,
      },
    })
    vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeFocus<CR>', { desc = 'Focus file explorer' })
    vim.keymap.set('n', '<leader>ex', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFile<CR>', { desc = 'Toggle file explorer on cursor' })
    vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
    vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })

    -- local function open_nvim_tree(data)
    --   -- Check if the current buffer is a directory
    --   local directory = vim.fn.isdirectory(data.file) == 1
    --   if not directory then
    --     return
    --   end
    --
    --   -- Change the current working directory to the directory of the file
    --   vim.cmd.cd(data.file)
    --
    --   -- Open nvim-tree in a new window to avoid it occupying the entire window
    --   require("nvim-tree.api").tree.open({ current_window = false })
    -- end
    --
    -- -- Create the autocmd to trigger the function on VimEnter
    -- vim.api.nvim_create_autocmd({ "VimEnter" }, {
    --   callback = open_nvim_tree,
    --   desc = "Open nvim-tree at startup for directories"
    -- })
  end
}
