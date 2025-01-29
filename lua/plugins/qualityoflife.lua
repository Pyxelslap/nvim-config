return {
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			filetypes = {
				"*",
				css = { css = true, rgb_fn = true, names = false },
				html = { names = false }
			}
		},
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			}
			require("telescope").load_extension("ui-select")
		end
	},
	{
		'gelguy/wilder.nvim',
		config = function()
			local wilder = require('wilder')
			wilder.setup({ modes = { ':', '/', '?' } })

			wilder.set_option('renderer', wilder.popupmenu_renderer({
				highlighter = wilder.basic_highlighter(),
			}))
		end
	},
	{
		'wakatime/vim-wakatime',
		lazy = false
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	{
		"mattn/emmet-vim",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				theme = 'hyper',
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
						{
							icon = ' ',
							icon_hl = '@variable',
							desc = 'Files',
							group = 'Label',
							action = 'Telescope find_files',
							key = 'f',
						},
					},
				}, }
		end,
		dependencies = { { 'nvim-tree/nvim-web-devicons' } }
	}
}
