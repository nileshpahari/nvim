require("config.lazy")

-- temp mappings, may change later
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})


-- theme
vim.cmd.colorscheme 'tokyonight-night'

-- options
local set = vim.opt
set.shiftwidth = 4
set.number = true
set.relativenumber = true
set.clipboard = "unnamedplus"  

local name = "nilesh"
