  return {
    'romgrk/barbar.nvim',
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    event = { "VeryLazy" },
    keys = {
      { "<leader>bl", "<CMD>BufferMovePrevious<CR>", mode = {"n"}, desc = "[Buffer] Move buffer left"  },
      { "<leader>br", "<CMD>BufferMoveNext<CR>",     mode = {"n"}, desc = "[Buffer] Move buffer right" },
      { "<leader>bp", "<CMD>BufferPick<CR>",     mode = {"n"}, desc = "[Buffer] buffer pick" },
      { "H", "<CMD>BufferPrevious<CR>",     mode = {"n"}, desc = "[Buffer] Previous buffer"   },
      { "L", "<CMD>BufferNext<CR>",         mode = {"n"}, desc = "[Buffer] Next buffer"       },
      { "<leader>dc", "<CMD>BufferClose<CR>",         mode = {"n"}, desc = "[Buffer] Close"       },
      { "<leader>do", "<CMD>BufferCloseAllButCurrent<CR>",    mode = {"n"}, desc = "[Buffer] CloseAllButCurrent"       },
      { "<leader>dl", "<CMD>BufferCloseBuffersLeft<CR>",    mode = {"n"}, desc = "[Buffer] Close left"       },
      { "<leader>dr", "<CMD>BufferCloseBuffersRight<CR>",    mode = {"n"}, desc = "[Buffer] Close right"       },
    },
    opts = {
      animation = false,
      -- Automatically hide the tabline when there are this many buffers left.
      -- Set to any value >=0 to enable.
      auto_hide = 1,

      -- Set the filetypes which barbar will offset itself for
      sidebar_filetypes = {
        NvimTree = true, -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
      },
    },
  }
