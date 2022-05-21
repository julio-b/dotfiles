set noerrorbells

set encoding=utf-8 fileencoding=utf-8

let mapleader=" "

source ~/.vim/plugins.vim
source ~/.vim/maps.vim

filetype plugin indent on
set autoindent copyindent cindent
set tabstop=8 softtabstop=4 shiftwidth=4 noexpandtab

set hlsearch incsearch ignorecase smartcase
set inccommand=split

set complete=.,w,b,u,t,i,d
set completeopt=longest,menuone,preview
set wildmenu
set wildmode=list:longest,full

set cpoptions+=n$_
set whichwrap+=<,>,[,]
set showmatch

set shortmess=atIc
set title
set list
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
set scrolloff=3
set wrap linebreak
set splitright splitbelow

syntax enable
set cursorline
set colorcolumn=90
set synmaxcol=400
set lazyredraw

colorscheme gruvbox

set number relativenumber
augroup numbertoggle
	"relativenumber only in normal mode, disable number for help and term
	autocmd!
	autocmd FileType help     setlocal nonumber norelativenumber
	autocmd FileType man     setlocal nonumber norelativenumber signcolumn=no
	autocmd TermOpen term://* setlocal nonumber norelativenumber signcolumn=no
	autocmd InsertLeave,BufEnter,FocusGained,WinEnter *
	    \ if &ft !~# 'man\|help' && &bt != 'terminal' | setlocal relativenumber | endif
	autocmd InsertEnter,BufLeave,FocusLost,WinLeave   *
	    \ if &ft !~# 'man\|help' && &bt != 'terminal' | setlocal norelativenumber | endif
	autocmd BufEnter,WinEnter,FocusGained * setlocal cursorline
	autocmd BufLeave,WinLeave,FocusLost * setlocal nocursorline
augroup END

augroup session
	autocmd!
	autocmd BufRead * autocmd FileType <buffer> ++once
	      \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$")
	      \| exe 'normal! g`"' | endif
augroup END

augroup myvimrc
	autocmd!
	" disable autocomment for newline,o,O
	autocmd QuickFixCmdPost helpgrep cwindow

	autocmd FileType vim setlocal formatoptions-=ro
	autocmd FileType tex,markdown,gitcommit setlocal spell
	autocmd FileType c,cpp setlocal tabstop=8 shiftwidth=8 softtabstop=8 textwidth=80 colorcolumn=81 noexpandtab cindent cinoptions=:0,l1,t0,g0,(0
augroup END


set updatetime=300
set signcolumn=yes

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=500 }
augroup END

"hi Visual ctermbg=black ctermfg=white
