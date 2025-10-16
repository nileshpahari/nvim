return {
	'akinsho/bufferline.nvim',
	tag = "*",
	config = function()
		require("bufferline").setup {}
	end,
	requires = 'nvim-tree/nvim-web-devicons',
}

