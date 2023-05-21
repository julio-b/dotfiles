return {
	"tpope/vim-fugitive",
	"rhysd/git-messenger.vim",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup()
		end,
	},
}
