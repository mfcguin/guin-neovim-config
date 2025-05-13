return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufReadPost", -- 在读取文件后加载
  opts = {
    keywords = {
      FIX = {
        icon = " ", -- 图标
        color = "error", -- 高亮颜色
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- 其他关键字
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },
    search = {
      command = "rg", -- 使用 ripgrep 搜索
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      pattern = [[\b(KEYWORDS):]], -- 匹配关键字的正则表达式
    },
  },
  config = function(_, opts)
    require("todo-comments").setup(opts)
  end,
  keys = {
    { "<leader>ut", "<cmd>TodoTelescope<CR>", desc = "Todo Comments (Telescope)" },
    { "<leader>uq", "<cmd>TodoQuickFix<CR>", desc = "Todo Comments (QuickFix)" },
    { "<leader>ul", "<cmd>TodoLocList<CR>", desc = "Todo Comments (LocList)" },
  },
}

