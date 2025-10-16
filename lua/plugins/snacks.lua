return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	keys = {
		--		{ "<leader>e", false },
		{
			"<leader>e",
			function()
				---@param opts? snacks.picker.explorer.Config|{}
				Snacks.explorer.open(opts)
			end,
			desc = "Explorer",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep({
					-- Exclude results from grep picker
					-- I think these have to be specified in gitignore syntax
					exclude = { "dictionaries/words.txt" },
				})
			end,
			desc = "Grep",
		},
		--[[{
		"<leader>sg",
		function()
			Snacks.picker.grep_word()
		end,
		desc = "Grep selection"
	},]]
		-- Open git log in vertical view
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log({
					finder = "git_log",
					format = "git_log",
					preview = "git_show",
					confirm = "git_checkout",
					layout = "vertical",
				})
			end,
			desc = "Git Log",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help pages",
		},
		{
			"<leader>st",
			function()
				Snacks.picker.colorschemes({ layout = "ivy" })
			end,
			desc = "Theme selector",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps({
					layout = "vertical",
				})
			end,
			desc = "Keymaps",
		},
		-- File picker
		{
			"<leader><space>",
			function()
				Snacks.picker.files({
					finder = "files",
					format = "file",
					show_empty = true,
					supports_live = true,
					-- In case you want to override the layout for this keymap
					-- layout = "vscode",
				})
			end,
			desc = "Find Files",
		},
		-- Navigate my buffers
		{
			"<S-T>",
			function()
				Snacks.picker.buffers({
					-- I always want my buffers picker to start in normal mode
					on_show = function()
						vim.cmd.stopinsert()
					end,
					finder = "buffers",
					format = "buffer",
					hidden = false,
					unloaded = true,
					current = true,
					sort_lastused = true,
					win = {
						input = {
							keys = {
								["d"] = "bufdelete",
							},
						},
						list = { keys = { ["d"] = "bufdelete" } },
					},
					-- In case you want to override the layout for this keymap
					-- layout = "ivy",
				})
			end,
			desc = "[P]Snacks picker buffers",
		},
	},
	opts = {
		bigfile = { enabled = true },
		image = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true, layout = { cycle = false } },
		indent = { enabled = true },
		input = { enabled = true },
		picker = {
			enabled = true,
			matcher = {
				frecency = true,
			},
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
						["J"] = { "preview_scroll_down", mode = { "i", "n" } },
						["K"] = { "preview_scroll_up", mode = { "i", "n" } },
						["H"] = { "preview_scroll_left", mode = { "i", "n" } },
						["L"] = { "preview_scroll_right", mode = { "i", "n" } },
					},
				},
			},
		},

		notifier = {
			enabled = false,
			top_down = false, -- place notifications from top to bottom
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
