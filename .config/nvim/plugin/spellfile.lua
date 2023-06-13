-- en is provided by the system, el needs to be generated
-- disable spellfile.vim because it is not necessary
vim.g.loaded_spellfile_plugin = 1

vim.api.nvim_create_autocmd("SpellFileMissing", {
	pattern = "el",
	callback = function (ev)
		vim.notify_once("Generating " .. ev.file .. " spellfile, be patient")
		vim.fn.execute([[!make --directory=~/.config/nvim/spell/]], false)
		-- TODO ^ use lua instead of Makefile?
	end
})
