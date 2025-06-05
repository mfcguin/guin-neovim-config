return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	cmd = "Telescope",
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
	end,
	keys = {
		-- 文件相关
		{ ",f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ ",g", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
		{ ",b", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
		{ ",h", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
		{ ",r", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
		{ ",w", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
		{ ",d", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },

    	-- 搜索相关
		{ ",c", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ ",k", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
		{ ",m", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
	--	{ ";so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
		--{ ",r", "<cmd>Telescope resume<cr>", desc = "Resume" },

    -- LSP 相关
		{
			",s",
			function()
				require("telescope.builtin").lsp_document_symbols({
					symbols = { "Function", "Method", "Class", "Interface", "Variable" },
				})
			end,
			desc = "Document Symbols",
		},

    {
			",S",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols({
					symbols = { "Function", "Method", "Class", "Interface", "Variable" },
				})
			end,
			desc = "Workspace Symbols",
		},
	},
}
