vim.api.nvim_create_autocmd('DiagnosticChanged', {
	group = vim.api.nvim_create_augroup('nvim-statusline-diag', {}),
	callback = function()
		local diagnostic_status = {}
		for i, s in pairs({ 'ERROR', 'WARN', 'INFO', 'HINT' }) do
			local di = vim.diagnostic.get(0, { severity = s })
			-- if #di > 0 then table.insert(diagnostic_status, s:sub(1, 1) .. #di) end
			if #di > 0 then table.insert(diagnostic_status, '%' .. i + 3 .. '*' .. s:sub(1, 1) .. #di) end
		end
		table.insert(diagnostic_status, '%*')
		vim.b[0].diagnostic_status = table.concat(diagnostic_status, ' ')
	end,
	desc = "Update diagnostic_status flags for statusline"
})


vim.go.statusline =
[[%<%f %{%get(b:,'gitsigns_status','')%} %h%m%r%k%= %{%get(b:,'diagnostic_status','')%} %-9.(%l,%c%V%) %P %y]]
