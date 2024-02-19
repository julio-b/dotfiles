-- link GitSigns highlights to appropriate diff colors
local GitSignsHLCreate = function()
	local hlMap = {
		{ 'DiffAdd',    'GitSignsAdd' },
		{ 'DiffChange', 'GitSignsChange' },
		{ 'DiffDelete', 'GitSignsDelete' },
	}
	for _, m in pairs(hlMap) do
		local togroup = vim.api.nvim_get_hl(0, { name = m[1] })
		local fromgroup = m[2]
		if togroup.reverse or togroup.bg == nil then
			vim.api.nvim_set_hl(0, fromgroup, { fg = togroup.fg, ctermfg = togroup.ctermfg })
		else
			vim.api.nvim_set_hl(0, fromgroup, { fg = togroup.bg, ctermfg = togroup.ctermbg })
		end
	end
end

local removeHLReverse = function(hlname)
	local hl = vim.api.nvim_get_hl(0, { name = hlname })

	hl.bold = false
	if hl.cterm then
		hl.cterm.bold = false
	end

	if hl.reverse then
		hl.reverse = nil
		local tmpc = hl.fg
		hl.fg = hl.bg
		hl.bg = tmpc
	end

	if hl.cterm and hl.cterm.reverse then
		hl.cterm.reverse = nil
		local tmpc = hl.ctermfg
		hl.ctermfg = hl.ctermbg
		hl.ctermbg = tmpc
	end

	vim.api.nvim_set_hl(0, hlname, hl)
end

local colorFix = vim.api.nvim_create_augroup("ColorSchemeFix", {})
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	group = colorFix,
	pattern = { '*' },
	desc = "GitSigns highlights fix",
	callback = function(ev)
		if (ev.match == 'default' or ev.match == 'pablo') then
			vim.api.nvim_set_hl(0, 'SignColumn', {})
		end

		GitSignsHLCreate()
		removeHLReverse('StatusLine')
		removeHLReverse('StatusLineNC')

		-- Generate statusline UserN highlights for GitSigns and Diagnostics
		local userHL = {
			'GitSignsAdd',
			'GitSignsChange',
			'GitSignsDelete',
			'DiagnosticSignError',
			'DiagnosticSignWarn',
			'DiagnosticSignInfo',
			'DiagnosticSignHint',
		}
		local hl = vim.api.nvim_get_hl(0, { name = 'StatusLine' })
		for i, hlname in pairs(userHL) do
			local maphl = vim.api.nvim_get_hl(0, { name = hlname, link = false })
			hl.fg = maphl.fg
			hl.ctermfg = maphl.ctermfg
			vim.api.nvim_set_hl(0, "User" .. i, hl)
		end
	end
})
