--- TODO tabular, neorg
return {
	"tpope/vim-surround",

	{
		-- gc to comment
		'numToStr/Comment.nvim',
		opts = {}
	},

	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "latexmk"
		end,
	},

	{
		---- show colors #808000 #000444
		"NvChad/nvim-colorizer.lua",
		opts = {
			filetypes = {
				"*",
				"!fugitiveblame",
				"!help",
				"!lazy",
			}
		},
	},

}
