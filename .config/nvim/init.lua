vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Package default files, and vim-spell
vim.opt.rtp:prepend("/usr/share/vim/vimfiles")

-- Install package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
      lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json",
})

vim.cmd [[cnoreabbrev lz Lazy]]
vim.opt.termguicolors = true
vim.cmd [[colorscheme quiet]]
