let $BAT_THEME = 'ansi'
let $DELTA_FEATURES='+light-theme'
"let $DELTA_FEATURES='+diff-highlight'

let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'Ctrl-p']
let g:fzf_vim.grep_multi_line = 0

let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Alt-a, Alt-d is not passed correctly to embed term. Use this as a workaround
" https://github.com/junegunn/fzf.vim/issues/54#issuecomment-899050631
" https://github.com/junegunn/fzf.vim/issues/731#issuecomment-767694125
"let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-q:select-all+accept'
let $FZF_DEFAULT_OPTS = '--bind á:select-all,ä:deselect-all,ñ:select-all+accept'

"command!  -bang -nargs=* Rg  call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".fzf#shellescape(<q-args>), fzf#vim#with_preview({'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all'}), <bang>0)
