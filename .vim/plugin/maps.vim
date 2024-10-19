nnoremap <Right>   <cmd>vertical resize +5<cr>
nnoremap <Left>    <cmd>vertical resize -5<cr>
nnoremap <Up>      <cmd>resize +5<cr>
nnoremap <Down>    <cmd>resize -5<cr>

function s:hjklmaps(_, key)
	exe "inoremap <A-S-"..a:key..">    \<C-\><C-n><C-w>"..toupper(a:key)
	exe "inoremap <A-"..a:key..">      \<C-\><C-n><C-w>"..a:key
	exe "nnoremap <A-S-"..a:key..">    <C-w>"..toupper(a:key)
	exe "nnoremap <A-"..a:key..">      <C-w>"..a:key
	exe "tnoremap <A-S-"..a:key..">    <C-w>"..toupper(a:key)
	exe "tnoremap <A-"..a:key..">      <C-w>"..a:key
endfunction
eval "hjkl"->foreach(funcref('s:hjklmaps'))

"tnoremap <Esc>      <C-\><C-n>

nnoremap <C-c><C-c> <cmd>belowright terminal<CR>

" visual mode shifting
vnoremap < <gv
vnoremap > >gv

"TODO
"nnoremap [g  <cmd>Gitgutter prev_hunk<CR>
"nnoremap ]g  <cmd>Gitgutter next_hunk<CR>

nnoremap <leader>l <cmd>Buffers<CR>
nnoremap <leader>f <cmd>Files<CR>
nnoremap <leader>g <cmd>GFiles<CR>
nnoremap <leader>/ <cmd>RG<CR>
nnoremap <leader>w <cmd>update<CR>
nnoremap <leader>d <cmd>bd<CR>
nnoremap <leader>. <cmd>call fzf#vim#gitfiles('', fzf#vim#with_preview({'dir': expand('$HOME')}))<CR>
"nnoremap <leader>` <cmd>call fzf#vim#gitfiles('', fzf#vim#with_preview({'dir': expand('$HOME/.vim/')}))<CR>
nnoremap <leader>` <cmd>call fzf#vim#files(expand('$HOME/.vim/'), fzf#vim#with_preview())<CR>
nnoremap <C-L> <cmd>nohlsearch<bar>diffupdate<bar>normal! <C-L><CR>
nnoremap Y y$

nnoremap <silent> ]q <cmd>cnext<CR>
nnoremap <silent> ]Q <cmd>clast<CR>
nnoremap <silent> [q <cmd>cprevious<CR>
nnoremap <silent> [Q <cmd>cfirst<CR>
nnoremap <silent> ]w <cmd>lnext<CR>
nnoremap <silent> ]W <cmd>llast<CR>
nnoremap <silent> [w <cmd>lprevious<CR>
nnoremap <silent> [W <cmd>lfirst<CR>
nnoremap <BS> <C-^>

noremap  <expr> j  v:count ? 'j' : 'gj'
noremap  <expr> k  v:count ? 'k' : 'gk'
nnoremap <expr> j  v:count ? (v:count > 5 ? "m'" .. v:count : '') .. 'j' : 'gj'
nnoremap <expr> k  v:count ? (v:count > 5 ? "m'" .. v:count : '') .. 'k' : 'gk'

nnoremap <F2> <cmd>setlocal spell! spell?<CR>
inoremap <F2> <cmd>setlocal spell!<CR>
nnoremap <leader>s 1z=]s

inoremap <A-,> <C-^>
"cnoremap <A-,> <C-^><C-R>=eval(string(&ims)->popup_create(#{line: &lines-1, col:1, time:1700}))<CR>
nnoremap <A-,> <cmd>execute "set imi="..(&imi== 1 ? '0' : '1').." imi?"<CR>


" quickly edit your macro, copied from:
" https://github.com/chrisbra/vim_dotfiles/blob/03f29cf1b6c7643788bc43dc35c788df753b6356/mapping.vim#L28
nnoremap <leader>m  :<c-u><c-r>='let @'.. v:register ..' = '.. string(getreg(v:register))<cr><c-f><left>

" print the syntax stack under the cursor: :h synstack()
nnoremap <F9> <cmd>echo synstack(line("."), col("."))->map({_, id -> synIDattr(id, "name")})<CR>

