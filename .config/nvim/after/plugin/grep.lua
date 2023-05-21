if vim.fn.executable("rg") == 1 then
	vim.o.grepprg = 'rg --vimgrep --smart-case --hidden --no-heading'
	vim.o.grepformat = '%f:%l:%c:%m,%f:%l:%m'
elseif vim.fn.executable("ag") then
	vim.o.grepprg = 'ag --vimgrep --smart-case --hidden'
	vim.o.grepformat = '%f:%l:%c:%m'
end
