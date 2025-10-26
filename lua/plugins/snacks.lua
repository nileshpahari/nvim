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
		{
			"<leader>st",
			function()
				Snacks.picker.todo_comments()
			end,
			desc = "Todo",
		},
		{
			"<leader>sT",
			function()
				Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
			end,
			desc = "Todo/Fix/Fixme",
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
			"<leader>ft",
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
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects({
					finder = "recent_projects",
					format = "file",
					dev = { "~/repo" },
					confirm = "load_session",
					patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "Makefile", "Cargo.toml" },
					recent = true,
					matcher = {
						frecency = true, -- use frecency boosting
						sort_empty = true, -- sort even when the filter is empty
						cwd_bonus = false,
					},
					sort = { fields = { "score:desc", "idx" } },
					win = {
						preview = { minimal = true },
						input = {
							keys = {
								-- every action will always first change the cwd of the current tabpage to the project
								["<c-e>"] = { { "tcd", "picker_explorer" }, mode = { "n", "i" } },
								["<c-f>"] = { { "tcd", "picker_files" }, mode = { "n", "i" } },
								["<c-g>"] = { { "tcd", "picker_grep" }, mode = { "n", "i" } },
								["<c-r>"] = { { "tcd", "picker_recent" }, mode = { "n", "i" } },
								["<c-w>"] = { { "tcd" }, mode = { "n", "i" } },
								["<c-t>"] = {
									function(picker)
										vim.cmd("tabnew")
										Snacks.notify("New tab opened")
										picker:close()
										Snacks.picker.projects()
									end,
									mode = { "n", "i" },
								},
							},
						},
					},
				})
			end,
			desc = "Projects",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},

		{
			"<leader>gP",
			function()
				local dirs = { "~/repo", "~/code" }
				local paths = {}
				-- collect all subdirectories
				for _, base in ipairs(dirs) do
					local expanded = vim.fn.expand(base)
					local handle = io.popen("find " .. expanded .. " -mindepth 1 -maxdepth 2 -type d 2>/dev/null")
					if handle then
						for dir in handle:lines() do
							table.insert(paths, dir)
						end
						handle:close()
					end
				end
				-- open fuzzy picker
				Snacks.picker.select({
					title = "Open Project",
					items = paths,
					format = function(item)
						return item:gsub(vim.fn.expand("~"), "~")
					end,
					confirm = function(selected)
						if not selected or selected == "" then
							return
						end
						local dir = vim.fn.expand(selected)
						vim.cmd("cd " .. dir)
						vim.cmd("edit .")
						vim.notify("Opened " .. dir, vim.log.levels.INFO)
					end,
				})
			end,
			desc = "Open Project Folder (like VS Code)",
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
