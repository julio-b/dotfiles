" install vim-plug if it doesnt exists
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-html', 'coc-json', 'coc-python', 'coc-pairs', 'coc-vimtex']

" Need to pacman -S fzf, /usr/share/vim/vimfiles/plugin/fzf.vim is loaded automatically
Plug 'https://github.com/junegunn/fzf.vim'
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif


Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_operator='<leader>c'
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1
let g:better_whitespace_verbosity=1

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 500

Plug 'norcalli/nvim-colorizer.lua'

Plug 'lervag/vimtex'
let g:tex_flavor = "latex"
let g:tex_comment_nospell = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
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

Plug 'mike-hearn/base16-vim-lightline'
Plug 'itchyny/lightline.vim' | Plug 'maximbaz/lightline-ale'
set showcmd
set noshowmode
set laststatus=2
let g:lightline = {
		\ 'colorscheme': 'base16_gruvbox_dark_pale',
		\ 'active': {
		\   'left': [ [ 'mode', 'lang', 'paste' ],
		\             [ 'fugitive', 'filename' ] ],
		\   'right': [ [ 'lineinfo' ],
		\              [ 'percent' ],
		\              [ 'fileformat', 'fileencoding', 'filetype' ],
		\              [ 'cocstatus', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
		\ },
		\ 'component_function': {
		\   'fugitive': 'LightLineFugitive',
		\   'readonly': 'LightLineReadonly',
		\   'modified': 'LightLineModified',
		\   'filename': 'LightLineFilename',
		\   'fileformat': 'LightlineFileformat',
		\   'filetype': 'LightlineFiletype',
		\   'lang'    : 'LightLineKeymap'
		\ }
		\ }

let g:lightline.component_expand = {
		\  'linter_checking': 'lightline#ale#checking',
		\  'linter_warnings': 'lightline#ale#warnings',
		\  'linter_errors': 'lightline#ale#errors',
		\  'linter_ok': 'lightline#ale#ok',
		\  'cocstatus': 'coc#status'
		\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:lightline.component_type = {
		\     'linter_checking': 'left',
		\     'linter_warnings': 'warning',
		\     'linter_errors': 'error',
		\     'linter_ok': 'left',
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
	if exists("*FugitiveHead")
		let branch = FugitiveHead()
		return branch !=# '' ? ''.branch : ''
	endif
	return ''
endfunction

function! LightLineFilename()
	let readonly = LightLineReadonly() !=# '' ? LightLineReadonly() . ' ' : ''
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
	let modified = LightLineModified() !=# '' ? ' ' . LightLineModified() : ''
	return readonly . filename . modified
endfunction

function! LightLineKeymap()
	let keymap_name_ = exists('b:keymap_name') ?
		\ b:keymap_name == 'grk' ? 'GR' : b:keymap_name
		\ : ''
	return (&iminsert != 0 ? keymap_name_ : '')
endfunction

function! LightlineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
	return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction



Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'


Plug 'sbdchd/neoformat'


call plug#end()

command! PU PlugUpdate | PlugUpgrade
set termguicolors
lua require'colorizer'.setup()
