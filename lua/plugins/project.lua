return {
  {
    "ahmedkhalf/project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" }, -- 可选，与 Telescope 集成
    event = "BufReadPost", -- 在读取文件后加载
    opts = {
      detection_methods = { "pattern", "lsp" }, -- 使用文件模式和 LSP 检测项目根目录
      patterns = { ".git", "package.json", "Makefile", "CMakeLists.txt" }, -- 项目根目录的标志文件
      show_hidden = true, -- 显示隐藏文件
      silent_chdir = false, -- 切换目录时显示消息
      scope_chdir = "global", -- 全局切换目录
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)

      -- 如果使用 Telescope，加载项目扩展
      if pcall(require, "telescope") then
        require("telescope").load_extension("projects")
      end
    end,
    keys = {
      { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Find Projects" }, -- 快捷键绑定
    },
  },
}

