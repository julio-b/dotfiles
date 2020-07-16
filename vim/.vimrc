set nocompatible
set noerrorbells

set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8

let mapleader=" "

source ~/.vim/plugins.vim
source ~/.vim/maps.vim

filetype plugin indent on
set autoindent copyindent cindent
set tabstop=8 softtabstop=4 shiftwidth=4 noexpandtab
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

colorscheme gruvbox

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
	autocmd BufEnter,WinEnter,FocusGained * setlocal cursorline
	autocmd BufLeave,WinLeave,FocusLost * setlocal nocursorline
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




set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
