return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			-- use faster fzf implementation in c
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
		},
	},
	config = function()
		require('telescope').setup {
			defaults = {
				mappings = {
					i = {
						-- ['<C-u>'] = false,
						-- ['<C-d>'] = false,
					},
				},
			},
		}
		pcall(require('telescope').load_extension, 'fzf')
		vim.cmd [[cnoreabbrev ts Telescope]] -- [[ :ts -> :Telescope

		local e = function()
			require('telescope.builtin').find_files {
				prompt_title = "~ nvim files ~",
				shorten_path = false,
				cwd = "~/.config/nvim",
				hidden = true,
				no_ignore_parent = true,
				layout_strategy = "flex",
				layout_config = {
					width = 0.9,
					height = 0.8,
					horizontal = {
						width = { padding = 0.15 },
					},
					vertical = {
						preview_height = 0.75,
					},
				},
			}
		end

		local dots =  function()
			require('telescope.builtin').git_files {
				prompt_title = "~ dotfiles ~",
				shorten_path = false,
				cwd = "~/",
				layout_strategy = "bottom_pane",
				layout_config = {
					height = 0.6,
					horizontal = {
						width = { padding = 0.15 },
					},
					vertical = {
						preview_height = 0.75,
					},
				},
			}
		end

		vim.keymap.set('n', '<leader>~', e)
		vim.keymap.set('n', '<leader>.', dots)
	end
}
