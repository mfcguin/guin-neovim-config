return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  keys = {
    { "H", ":BufferLineCyclePrev<CR>", desc = "Buffer: Previous" },
    { "L", ":BufferLineCycleNext<CR>", desc = "Buffer: Next", silent = true },
    { "<leader>bp", ":BufferLinePick<CR>", desc = "Buffer: Pick", silent = true },
    { "<leader>bd", ":bdelete<CR>", mode = "n", desc = "Buffer: Delete", silent = true },
    { "<leader>bo", ":BufferLineCloseOthers<CR>", desc = "Buffer: Close Others", silent = true },
    { "<leader>bl", ":BufferLineCloseLeft<CR>", desc = "Buffer: Cose Left", silent = true },
    { "<leader>br", ":BufferLineCloseRight<CR>", desc = "Buffer: Cose Right", silent = true },
  },
  opts = {},
  lazy = false
}
