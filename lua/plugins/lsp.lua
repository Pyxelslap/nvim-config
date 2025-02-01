return {
	{
		"williamboman/mason.nvim",
		event = 'VeryLazy',
		config = function()
			require('mason').setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensured_installed = { "lua_ls", "ts_ls", "prettier" },
				automatic_installation = true
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				filetypes = { "lua" },
				settings = {
					lua = {
						diagnostics = {
							enable = true,
							globals = { "vim" }
						}
					}
				}
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
			})
			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
				filetypes = { "html" },
				init_options = {
					--- @type boolean Defaults to `true`
					showAbbreviationSuggestions = true,
					--- @type "always" | "never" Defaults to `"always"`
					showExpandedAbbreviation = "always",
					--- @type boolean Defaults to `false`
					showSuggestionsAsSnippets = true,
				},
			})
			lspconfig.cssmodules_ls.setup({
				capabilities = capabilities,
				on_attach = custom_on_attach,
				init_options = {
					camelCase = 'dashes',
				},
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
				filetypes = { "css", "scss", "less" },
				init_options = {
					provideFormatter = false
				}
			})
			lspconfig.css_variables.setup({
				capabilities = capabilities,
				filetypes = { "css", "scss", "less" }
			})
			--
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
		end
	},
	{
		'stevearc/conform.nvim',
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require('conform')

			conform.setup({
				formatters_by_ft = {
					lua = { "lua-language-server" },
					html = { "prettier" },
					css = { "prettier" },
					javascript = { "prettier" },
					typescript = { 'prettier' }
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				}
			})

			vim.keymap.set('n', '<leader>f', function()
				conform.format({
					lsp_fallback = true,
					async = true,
					timeout_ms = 1000,

				})
			end)
		end
	},
}
