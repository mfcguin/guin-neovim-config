return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"typescript-language-server",
				"vue-language-server",
				"css-lsp",
				"tailwindcss-language-server",
				"emmet-ls",
				"html-lsp",
				"clangd",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp", "williamboman/mason.nvim" },

		-- example calling setup directly for each LSP
		config = function()
			vim.diagnostic.config({
				underline = false,
				signs = false,
				update_in_insert = true,
				virtual_text = { spacing = 2, prefix = "●" },
				severity_sort = true,
				float = {
					border = "rounded",
				},
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})

			lspconfig["ts_ls"].setup({
				o_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})

			lspconfig["clangd"].setup({
				o_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})

			lspconfig["volar"].setup({
				capabilities = capabilities,
				-- o_attach = function(client)
				-- 	client.server_capabilities.documentFormattingProvider = false
				-- 	client.server_capabilities.documentRangeFormattingProvider = false
				-- end,
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
				init_options = {
					vue = {
						hybridMode = false,
					},
					typescript = {
						tsdk = vim.fn.expand(
							"~/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib"
						),
					},
					-- languageFeatures = {
					-- 	implementation = true,
					-- 	references = true,
					-- 	definition = true,
					-- 	typeDefinition = true,
					-- 	callHierarchy = true,
					-- 	hover = true,
					-- 	rename = true,
					-- 	renameFileRefactoring = true,
					-- 	signatureHelp = true,
					-- 	codeAction = true,
					-- 	workspaceSymbol = true,
					-- 	completion = {
					-- 		defaultTagNameCase = "both",
					-- 		defaultAttrNameCase = "kebabCase",
					-- 		getDocumentNameCasesRequest = false,
					-- 		getDocumentSelectionRequest = false,
					-- 		-- 启用所有类型的补全
					-- 		completeFunctionCalls = true,
					-- 		-- 启用 this. 补全
					-- 		enabled = true,
					-- 		include = {
					-- 			module = true,
					-- 			property = true,
					-- 			method = true,
					-- 			event = true,
					-- 			constant = true,
					-- 		},
					-- 	},
					-- },
				},
				-- settings = {
				-- 	volar = {
				-- 		completion = {
				-- 			-- 自动导入
				-- 			autoImport = true,
				-- 			-- 启用详细的补全信息
				-- 			showAdvancedTips = true,
				-- 			-- 显示标签建议
				-- 			tagCasing = "both",
				-- 		},
				-- 		codeLens = {
				-- 			references = true,
				-- 			pugTools = true,
				-- 			scriptSetupTools = true,
				-- 		},
				-- 		diagnostics = {
				-- 			-- 启用语义检查
				-- 			semantic = true,
				-- 		},
				-- 	},
				-- },
			})
			lspconfig["cssls"].setup({
				o_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})
			lspconfig["html"].setup({
				o_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})
			lspconfig["tailwindcss"].setup({
				o_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})

			lspconfig["clangd"].setup({
				o_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			})

			lspconfig["sourcekit"].setup({
				-- capabilities = capabilities,
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			})

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)
					vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {
						buffer = ev.buf,
						desc = "[LSP] Show diagnostic",
					})
					vim.keymap.set("n", "<leader>gk", vim.lsp.buf.signature_help, { desc = "[LSP] Signature help" })
					vim.keymap.set(
						"n",
						"<leader>wa",
						vim.lsp.buf.add_workspace_folder,
						{ desc = "[LSP] Add workspace folder" }
					)
					vim.keymap.set(
						"n",
						"<leader>wr",
						vim.lsp.buf.remove_workspace_folder,
						{ desc = "[LSP] Remove workspace folder" }
					)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, { desc = "[LSP] List workspace folders" })
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "[LSP] Rename" })
				end,
			})
		end,
	},
}
