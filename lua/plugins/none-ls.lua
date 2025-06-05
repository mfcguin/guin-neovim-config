return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		local registry = require("mason-registry")

		local function install(name)
			local success, package = pcall(registry.get_package, name)
			if success and not package:is_installed() then
				package:install()
			end
		end

		install("stylua")
		install("prettier")
    install("clang-format")

		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format.with({
          filetypes = {
            "c",
          }
        }),
				-- 其他语言格式化
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"javascript",
						"typescript",
						"css",
						"scss",
						"vue",
						"tsx",
						"html",
						"json",
						"yaml",
						"markdown",
					},
				}),
			},
			-- on_attach = function(client, bufnr)
			-- 	if client.supports_method("textDocument/formatting") then
			-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 			callback = function()
			-- 				vim.lsp.buf.format()
			-- 			end,
			-- 		})
			-- 	end
			-- end,
		})
	end,
	keys = {
		{
			"<leader>lf",
			function()
				vim.lsp.buf.format()
			end,
		},
	},
}
