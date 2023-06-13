return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = false })
	end,
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		'nvim-treesitter/playground',
	},
	config = function()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = { "c", "cpp", "go", "lua", "vim", "bash", "python", "markdown",
				"cmake", "vimdoc", "query" },
			highlight = {
				enable = true,
				disable = { "latex" },
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = { "latex", "markdown" },
				--additional_vim_regex_highlighting = false
			},
			indent = {
				enable = true, disable = { "python", "latex" }
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<c-space>',
					node_incremental = '<c-space>',
					scope_incremental = '<c-s>',
					node_decremental = '<M-space>',
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						['aa'] = '@parameter.outer',
						['ia'] = '@parameter.inner',
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						[']m'] = '@function.outer',
						[']]'] = '@class.outer',
					},
					goto_next_end = {
						[']M'] = '@function.outer',
						[']['] = '@class.outer',
					},
					goto_previous_start = {
						['[m'] = '@function.outer',
						['[['] = '@class.outer',
					},
					goto_previous_end = {
						['[M'] = '@function.outer',
						['[]'] = '@class.outer',
					},
				},
				swap = {
					enable = true,
					swap_next = {
						['<leader>a'] = '@parameter.inner',
					},
					swap_previous = {
						['<leader>A'] = '@parameter.inner',
					},
				},
			},

		}
		vim.o.foldmethod = 'expr'
		vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.o.foldenable = false
		-- vim.o.foldcolumn = 'auto:5'
	end,
}
