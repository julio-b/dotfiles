inoremap jk <ESC>
inoremap kj <ESC>
map j gj
map k gk
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

nnoremap <silent> <leader>ve :execute 'edit' resolve($MYVIMRC)<cr>
nnoremap <silent> <leader>vx :source $MYVIMRC<cr>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>
nmap <silent> <leader><space> :nohlsearch<CR>
cmap w!! w !sudo tee > /dev/null %
set pastetoggle=<F1>
inoremap <C-U> <C-G>u<C-U>
nnoremap n nzzzv
nnoremap N Nzzzv
map Y y$
nnoremap <f9> :make<CR>
nnoremap <S-f9> :make clean<CR>
nnoremap <leader>l :Buffers<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>e :Files<CR>
nnoremap <leader>E :Sex<CR>
nnoremap <BS> :b#<CR>

" Keep indent selection in visual mode.
vnoremap < <gv
vnoremap > >gv

imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ?
                 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#close_popup()
                 \ : "\<CR>\<Plug>AutoPairsReturn"

set keymap=greek_utf-8
set iminsert=0
set imsearch=-1
inoremap <C-L> <C-^>

set spelllang=en,el
nnoremap <F2> :setlocal spell! spell?<CR>
nnoremap <leader>] ]s
nnoremap <leader>[ [s
nnoremap <leader>s z=
nnoremap <leader>S  :%s/σ\>/ς/g<cr>
"nnoremap <leader>Sa zg
"nnoremap <leader>SS :spellrepall

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
if has('nvim')
	nnoremap <C-c><C-c> :split term://bash<cr>i
	tnoremap <Esc> <C-\><C-n>
	tnoremap <A-h> <C-\><C-n><C-w>h
	tnoremap <A-j> <C-\><C-n><C-w>j
	tnoremap <A-k> <C-\><C-n><C-w>k
	tnoremap <A-l> <C-\><C-n><C-w>l
endif
