return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		{ "folke/snacks.nvim" },
	},
	ft = "python", -- Load when opening Python files
	keys = {
		{ ",v", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
	},
	opts = { -- this can be an empty lua table - just showing below for clarity.
		search = {
			my_venvs = {
				command = "fd python$ ~/.local/virtualenvs/",
			},
		}, -- if you add your own searches, they go here.
		options = {}, -- if you add plugin options, they go here.
	},
}
