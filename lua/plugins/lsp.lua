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
				filetypes = { 'css',
					'eruby',
					'html',
					'xml',
					'htmldjango',
					'javascriptreact',
					'less',
					'pug',
					'php',
					'sass',
					'scss',
					'typescriptreact',
					'htmlangular',
				},
				init_options = {
					includeLanguages = {},
					excludeLanguages = {},
					extensionsPath = {},
					preferences = {},
					showAbbreviationSuggestions = true,
					showExpandedAbbreviation = "always",
					showSuggestionsAsSnippets = false,
					syntaxProfiles = {},
					variables = {},
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
			lspconfig.pyright.setup({
				capabilities = capabilities,
				filetypes = { "python" }
			})
			lspconfig.intelephense.setup({
				capabilities = capabilities,
				filetypes = { "php" }
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
				filetypes = { "sh" }
			})
			--
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
			vim.keymap.set('n', '<leader>el', vim.diagnostic.setqflist, { desc = "Error list" })
		end
	},
	{ -- Formatter
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
					typescript = { 'prettier' },
					yaml = { "prettier" },
					yml = { "prettier" },
					php = { "phpcbf" },
					python = { "black" }
				},
				format_after_save = {
					lsp_fallback = true,
					async = true,
					timeout_ms = 1000,
				}
			})

			vim.keymap.set('n', '<leader>f', function()
				conform.format({
					lsp_fallback = true,
					async = true,
					timeout_ms = 1000,

				})
			end, { desc = "Format this buffer" })
		end
	},
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
		},
		config = function()
			require('codecompanion').setup({
				adapters = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							env = {
								api_key = "YOUR API KEY"
							},
						})
					end,
				},
				strategies = {
					-- Change the default chat adapter
					chat = {
						adapter = "gemini",
					},
					inline = {
						adapter = "gemini",
					},
					cmd = {
						adapter = "gemini",
					},
				},
				display = {
					chat = {
						window = {
							layout = "vertical", -- float|vertical|horizontal|buffer
							position = nil, -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
							border = "single",
							height = 0.8,
							width = 0.45,
							relative = "editor",
							full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
							opts = {
								breakindent = true,
								cursorcolumn = false,
								cursorline = false,
								foldcolumn = "0",
								linebreak = true,
								list = false,
								numberwidth = 1,
								signcolumn = "no",
								spell = false,
								wrap = true,
								number = false,
							},
						},
					}
				}
			})
		end
	},
}
