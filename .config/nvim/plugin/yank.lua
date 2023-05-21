vim.api.nvim_create_autocmd('TextYankPost', {
	group    = vim.api.nvim_create_augroup('nvim-yankhl', {}),
	callback = function()
		vim.highlight.on_yank { timeout = 100 }
	end,
	desc = "Briefly highlight yanked text"
})
