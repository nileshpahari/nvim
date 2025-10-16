local gruvbox = {
	"sainnhe/gruvbox-material",
	enabled = true,
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_transparent_background = 0
		vim.g.gruvbox_material_foreground = "mix"
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_ui_contrast = "high"
		vim.g.gruvbox_material_float_style = "bright"
		vim.g.gruvbox_material_statusline_style = "mix" -- Options: "original", "material", "mix", "afterglow"
		vim.g.gruvbox_material_cursor = "auto"
		-- vim.g.gruvbox_material_colors_override = { bg0 = '#16181A' } -- #0e1010
		-- vim.g.gruvbox_material_better_performance = 1
		vim.cmd.colorscheme("gruvbox-material")
	end,
}

local nordic = {
	'AlexvZyl/nordic.nvim',
	enabled = true,
	lazy = false,
	priority = 1000,
}

local catppuccin = {
	"catppuccin/nvim",
	enabled = true,
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "auto", -- latte, frappe, macchiato, mocha
		background = { -- :h background
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false, -- disables setting the background color.
		float = {
			transparent = false,  -- enable transparent floating windows
			solid = false,        -- use solid styling for floating windows, see |winborder|
		},
		show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
		term_colors = false,      -- sets terminal colors (e.g. `g:terminal_color_0`)
		dim_inactive = {
			enabled = false,      -- dims the background color of inactive window
			shade = "dark",
			percentage = 0.15,    -- percentage of the shade to apply to the inactive window
		},
		no_italic = false,        -- Force no italic
		no_bold = false,          -- Force no bold
		no_underline = false,     -- Force no underline
		styles = {                -- Handles the styles of general hi groups (see `:h highlight-args`):
			comments = { "italic" }, -- Change the style of comments
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
			-- miscs = {}, -- Uncomment to turn off hard-coded styles
		},
		lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		color_overrides = {},
		custom_highlights = {},
		default_integrations = true,
		auto_integrations = false,
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			notify = false,
			mini = {
				enabled = true,
				indentscope_color = "",
			},
			-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		},
	}
}

return {
	nordic,
	catppuccin,
	gruvbox
}
