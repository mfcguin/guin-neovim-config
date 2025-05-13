return {
	{
		"craftzdog/solarized-osaka.nvim",
    opts = {},
    config = function (_, opts)
      require("solarized-osaka").setup(opts)
      vim.cmd[[colorscheme solarized-osaka]]
    end
	},
}

