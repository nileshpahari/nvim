vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
	group = last_cursor_group,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Enable spell checking for certain file types
vim.api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	-- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
	{
		pattern = { "*.txt", "*.md", "*.tex" },
		callback = function()
			vim.opt.spell = true
			vim.opt.spelllang = "en"
		end,
	}
)

-- tmux shit
-- if vim.env.TMUX then
-- 	local group = vim.api.nvim_create_augroup("ToggleTmuxStatus", { clear = true })
--
-- 	local function tmux_status(state)
-- 		vim.system({ "tmux", "set", "status", state })
-- 	end
--
-- 	vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
-- 		group = group,
-- 		callback = function()
-- 			tmux_status("off")
-- 		end,
-- 	})
--
-- 	vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
-- 		group = group,
-- 		callback = function()
-- 			tmux_status("on")
-- 		end,
-- 	})
-- end
