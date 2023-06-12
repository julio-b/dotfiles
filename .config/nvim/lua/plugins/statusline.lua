return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local function keymap()
			-- show current keymap in statusline. Use A-S-L to switch
			return vim.o.iminsert ~= 0 and vim.b.keymap_name:gsub('grk', 'GR') or ''
		end
		local function diff_source()
			local gitsigns = vim.b.gitsigns_status_dict
			if gitsigns then
				return {
					added = gitsigns.added,
					modified = gitsigns.changed,
					removed = gitsigns.removed
				}
			end
		end
		require('lualine').setup({
			options = {
				section_separators = '',
				component_separators = '',
				icons_enabled = false,
				theme = 'auto'
			},
			sections = {
				lualine_b = { keymap, 'b:gitsigns_head', { 'diff', source = diff_source },
					'diagnostics' }
			},
			extensions = { 'quickfix' }
		})
	end,
}
