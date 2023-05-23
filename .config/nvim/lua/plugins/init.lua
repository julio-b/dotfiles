--- TODO tabular, neorg
return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd[[colorscheme gruvbox]]
		end,
	},

	"tpope/vim-surround",

	{
		-- gc to comment
		'numToStr/Comment.nvim',
		opts = {}
	},

	{
		"lervag/vimtex",
		lazy = false,
		ft = { "tex" },
		config = function()
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