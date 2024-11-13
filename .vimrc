unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
" Revert Q map from defaults.vim and disable warnings about q:
unmap Q
autocmd! vimHints

" make :Man available
runtime ftplugin/man.vim
cnoreabbrev <expr> man (getcmdtype() ==? ':' && getcmdline() ==# 'man' ? 'Man' : 'man')
cnoreabbrev <expr> hg (getcmdtype() ==? ':' && getcmdline() ==# 'hg' ? 'helpgrep' : 'hg')

set encoding=utf-8 termencoding=utf-8
let mapleader = " "

" Do not set the colorscheme here, it should be done after sourcing xtermkitty
"colorscheme lunaperche
" Those are enabled by defaults.vim
"filetype indent plugin on 
"syntax enable

set termguicolors
set fillchars=vert:│
set list listchars=tab:›\ ,trail:·,lead:·,extends:▸,precedes:◂,nbsp:_
set showbreak=⤷\ 
"set colorcolumn=+1
set cpoptions+=n$
set scrolloff=0
set formatoptions+=j1  " :h fo-1
set clipboard-=autoselect

set hlsearch incsearch ignorecase smartcase
set ttimeout ttimeoutlen=20
set history=1000

set wildmode=list:longest,full
set wildignore=*.o

set nospell spelllang=en,el
set keymap=greek_utf-8 iminsert=0 imsearch=0 "TODO try ims=-1

set hidden

set path+=**
if executable('rg')
	set grepprg=rg\ --vimgrep\ $* grepformat^=%f:%l:%c:%m
elseif executable('ag')
	set grepprg=ag\ --vimgrep\ $* grepformat^=%f:%l:%c:%m
endif

packadd! editorconfig
packadd! matchit
packadd! comment
packadd lsp

" Prevent loading of some default plugins
let g:loaded_vimballPlugin    = 1 | let g:loaded_vimball = 1
let g:loaded_getscriptPlugin  = 1 | let g:loaded_getscript = 1
let g:loaded_logiPat = 1

let g:termdebug_config = {}
let g:termdebug_config['variables_window'] = 1
let g:termdebug_config['variables_window_height'] = 4
let g:termdebug_config['wide'] = 1

" syntax and ftplugin settings
let g:c_syntax_for_h = 1

" swap and undo
let g:vimxdg = $'{$XDG_STATE_HOME ?? expand("~/.local/state")}/vim'
let &viminfofile = $"{g:vimxdg}/viminfo"
let &directory = $'{g:vimxdg}/swap//'
let &undodir = $'{g:vimxdg}/undo//'
if !isdirectory(&undodir)   | call mkdir(&undodir, "p") | endif
if !isdirectory(&directory) | call mkdir(&directory, "p") | endif
set undofile viminfo='200,<1000,s100,h
