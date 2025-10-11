return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      "nvim-telescope/telescope-ui-select.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          path_display = { 'smart' },
          mappings = {
            i = {
              ['<C-k>'] = actions.move_selection_previous,
              ['<C-j>'] = actions.move_selection_next,
              ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
              ['<C-l>'] = actions.complete_tag,
              ['<esc>'] = actions.close,
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })

      telescope.load_extension("ui-select")
      telescope.load_extension('fzf')

      vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader><leader>', '<cmd>Telescope buffers<cr>', { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>fc', '<cmd>Telescope commands<cr>', { desc = 'Telescope show commands' })
      vim.keymap.set('n', '<leader>fq', '<cmd>Telescope quickfix<cr>', { desc = 'Telescope quickfix' })
      vim.keymap.set('n', '<leader>ft', '<cmd>Telescope grep_string<cr>', { desc = 'Telescope grep string' })
      vim.keymap.set('n', '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>', { desc = 'Telescope search symbols' })
      vim.keymap.set('n', '<leader>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Telescope search symbols' })
      telescope.setup {
      }
    end,
  },
}
