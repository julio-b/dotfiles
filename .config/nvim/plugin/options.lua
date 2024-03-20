vim.go.fileencoding = 'utf-8'

vim.wo.signcolumn = 'yes'

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cindent = true
vim.o.copyindent = true
vim.o.preserveindent = true

vim.o.tabstop = 8     -- \t width 
vim.o.softtabstop = 8 -- spaces on TAB key press
vim.o.shiftwidth = 8  -- indent level width
vim.o.shiftround = true
vim.o.expandtab = false

vim.opt.formatoptions:append('1') -- :h fo-1

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = 'split'

vim.o.title = true

vim.o.listchars = "tab:› ,trail:·,lead:·,extends:▸,precedes:◂,nbsp:_"
vim.o.list = true
vim.opt.cpoptions:append('$n')
vim.o.showbreak = '⤷ '
vim.o.linebreak = true

vim.o.sidescrolloff = 5 --when using nowrap

vim.o.equalalways = true
vim.o.splitright = false
vim.o.splitbelow = false

vim.o.colorcolumn = "+1"

vim.o.cursorlineopt = 'number'
vim.o.cursorline = true -- Highlight the current line

vim.o.synmaxcol = 600

vim.o.timeoutlen = 450

vim.opt.shada:append { "'1000" } -- edited file marks
vim.o.undofile = true

vim.opt.wildignore:append { "*.o", "*.obj", "*~" }
vim.opt.wildignore:append { "__pycache__", "*.pyc" }
vim.opt.wildignore:append { "*.img", "*.str" }

vim.o.complete = '.,w,b,u,kspell,s,t,i,d'
vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }
vim.o.wildmode = 'lastused:longest:full,full'
vim.o.pumblend = 20

vim.opt.diffopt:append { "hiddenoff", "algorithm:histogram", "indent-heuristic", "linematch:60" }

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
