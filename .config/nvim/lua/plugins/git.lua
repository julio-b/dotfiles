return {
	"tpope/vim-fugitive",
	"rhysd/git-messenger.vim",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup({
				status_formatter = function(status)
					-- Colored git info for statusline
					local added, changed, removed = status.added, status.changed, status.removed
					local status_txt = { '', status.head }
					if added and added > 0 then table.insert(status_txt, '%1*+' .. added) end
					if changed and changed > 0 then table.insert(status_txt, '%2*~' .. changed) end
					if removed and removed > 0 then table.insert(status_txt, '%3*-' .. removed) end
					return '(' .. table.concat(status_txt, ' ') .. '%*)'
				end
			})
		end,
	},
}
