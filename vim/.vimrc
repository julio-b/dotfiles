set nocompatible
set noerrorbells

set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8

let mapleader=" "

source ~/.vim/plugins.vim
source ~/.vim/maps.vim

filetype plugin indent on
set autoindent copyindent smartindent cindent
set tabstop=4 shiftwidth=4 noexpandtab
set backspace=indent,eol,start

set hlsearch incsearch ignorecase smartcase
if has('nvim')
  set inccommand=split
endif

set complete=.,w,b,u,t,i,d
set completeopt=longest,menuone,preview
set wildmenu
set wildmode=list:longest,full

set cpoptions+=n$_
set conceallevel=2 concealcursor=niv
set whichwrap=b,s,<,>,[,]
set showmatch

set shortmess=atI
set title
set list
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
set scrolloff=3
set wrap linebreak breakindent
set hidden
set autoread
set splitright splitbelow

syntax enable
set background=dark
set cursorline
set colorcolumn=90
set synmaxcol=400
set lazyredraw

if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

set number relativenumber
augroup numbertoggle
	"relativenumber only in normal mode, disable number for help and term
	autocmd!
	autocmd FileType help     setlocal nonumber norelativenumber
	autocmd TermOpen term://* setlocal nonumber norelativenumber signcolumn=no
	autocmd InsertLeave,BufEnter,FocusGained,WinEnter *
	    \ if &ft != 'help' && @% !~# 'term://' | setlocal relativenumber | endif
	autocmd InsertEnter,BufLeave,FocusLost,WinLeave   *
	    \ if &ft != 'help' && @% !~# 'term://' | setlocal norelativenumber | endif
	autocmd WinEnter,FocusGained * setlocal cursorline
	autocmd WinLeave,FocusLost * setlocal nocursorline
augroup END

augroup session
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
	      \| exe "normal! g'\"" | endif
augroup END

augroup myvimrc
	autocmd!
	autocmd QuickFixCmdPost helpgrep cwindow
	autocmd  FileType fzf set laststatus=0 noruler
	      \| autocmd BufLeave <buffer> set laststatus=2 ruler
augroup END

" disable autocomment for newline,o,O
autocmd FileType vim setlocal formatoptions-=ro

autocmd FileType tex,markdown,gitcommit setlocal spell
autocmd FileType c,cpp setlocal tabstop=8 shiftwidth=8 softtabstop=8 textwidth=80 colorcolumn=81 noexpandtab cindent cinoptions=:0,l1,t0,g0,(0
