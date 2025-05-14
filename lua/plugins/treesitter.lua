return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        auto_install = true,
        ensure_installed = {
          "bash", "c", "c_sharp", "cpp", "css", "go", "html", "javascript", "json", "lua", "markdown",
            "markdown_inline", "python", "query", "rust", "toml", "typescript", "typst", "tsx", "vim", "vimdoc", "vue", "scss"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}

