return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			filesystem = {
				filtered_items = {
					visible = false, -- hide filtered items on open
					hide_gitignored = true,
					hide_dotfiles = false,
					hide_by_name = {
						".github",
						"package-lock.json",
						".changeset",
						".prettierrc.json",
					},
					never_show = { ".git" },
				},
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				version = "^1.0.0",
			},
		},
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				-- your config
			})

			telescope.load_extension("live_grep_args")

			vim.keymap.set("n", "<leader>fg",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
		end
	}
}
