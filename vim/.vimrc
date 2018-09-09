set nocompatible
set noerrorbells

inoremap jk <ESC>
inoremap kj <ESC>
map j gj
map k gk

let mapleader=" "
map <leader>s :source ~/.vimrc<CR>:let @/=''<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>
nmap <leader><space> :nohlsearch<CR>
cmap w!! w !sudo tee > /dev/null %
nnoremap <f12> :!ctags -R<cr>
map <C-f> :NERDTreeToggle<CR>
set pastetoggle=<F1>
inoremap <C-U> <C-G>u<C-U>
nnoremap n nzzzv
nnoremap N Nzzzv
map Y y$

"________vim-plug________________
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
"Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'xuhdev/indent-java.vim'
Plug 'chriskempson/base16-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'machakann/vim-highlightedyank'
Plug 'lervag/vimtex'
call plug#end()
"______________________________

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
scriptencoding utf-8

set autoindent
set copyindent
set smartindent
set cindent

filetype plugin indent on

set backspace=indent,eol,start
set noexpandtab
set tabstop=4
set shiftwidth=4

set number
set relativenumber
set showmatch

set hlsearch
set incsearch
set ignorecase
set smartcase

set hidden
set history=500
set ruler
"
"no intro msg
set shortmess=atI
"
"left-right next line
set whichwrap=b,s,<,>,[,]
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
set comments=sl:/*,mb:\ *,elx:\ */

set scrolloff=5
set cpoptions+=$
set wildmenu

set autoread
syntax enable
set fileformats=unix,dos,mac

set complete=.,w,b,u,t,i
set completeopt=longest,menuone,preview

if !has('nvim')
  set ttyfast
endif
set lazyredraw

set t_Co=256
set background=dark
set cursorline
set colorcolumn=90

if has('nvim')
  set inccommand=split
endif

colorscheme base16-default-dark
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

set splitright
set splitbelow

set keymap=greek_utf-8
set iminsert=0
set imsearch=-1

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" nvim terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif

let g:highlightedyank_highlight_duration = 500

"_____________lightline_______________________________________________
set showcmd
set noshowmode
set laststatus=2

let g:lightline = {
			\ 'colorscheme': 'jellybeans',
			\ 'active': {
			\   'left': [ [ 'mode', 'lang', 'paste' ],
			\             [ 'fugitive', 'filename' ] ]
			\ },
			\ 'component_function': {
			\   'fugitive': 'LightLineFugitive',
			\   'readonly': 'LightLineReadonly',
			\   'modified': 'LightLineModified',
			\   'filename': 'LightLineFilename',
			\   'lang'    : 'LightLineKeymap'
			\ },
			\ 'separator': { 'left': '', 'right': '' },
			\ 'subseparator': { 'left': '', 'right': '' }
			\ }

function! LightLineModified()
	if &filetype == "help"
		return ""
	elseif &modified
		return "+"
	elseif &modifiable
		return ""
	else
		return "-"
	endif
endfunction

function! LightLineReadonly()
	if &filetype == "help"
		return ""
	elseif &readonly
		return ""
	else
		return ""
	endif
endfunction

function! LightLineFugitive()
	if exists("*fugitive#head")
		let branch = fugitive#head()
		return branch !=# '' ? ''.branch : ''
	endif
	return ''
endfunction

function! LightLineFilename()
	return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
				\ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
				\ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineKeymap()
	let keymap_name_ = exists('b:keymap_name') ?
		\ b:keymap_name == 'grk' ? 'GR' : b:keymap_name
		\ : ''
	return (&iminsert != 0 ? keymap_name_ : '')
endfunction

"______________________________________________________________________


let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
      \ 'backend' : 'nvim',
      \ 'background' : 1,
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'options' : [
      \   '-xelatex',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}
"
" vim:ts=2:sw=2:et
