vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', 'kj', '<ESC>')

vim.keymap.set('', 'j', [[v:count ? 'j' : 'gj']], { expr = true, silent = true }) --[[ :h mapmode-nvo ]]
vim.keymap.set('', 'k', [[v:count ? 'k' : 'gk']], { expr = true, silent = true })
vim.keymap.set('n', 'j', [[v:count ? (v:count > 5 ? "m'" .. v:count : '') .. 'j' : 'gj']], { expr = true, silent = true })
vim.keymap.set('n', 'k', [[v:count ? (v:count > 5 ? "m'" .. v:count : '') .. 'k' : 'gk']], { expr = true, silent = true })


vim.keymap.set('n', '<leader>w', '<cmd>update<CR>')
vim.keymap.set('n', 'n', 'nzzzv', {silent = true})
vim.keymap.set('n', 'N', 'Nzzzv', {silent = true})

vim.keymap.set('n', '<leader>`' ,'<cmd>source %<CR>')


-- navigation
vim.keymap.set('n', ']b', '<cmd>bn<CR>')
vim.keymap.set('n', '[b', '<cmd>bp<CR>')
vim.keymap.set('n', '<leader>d', '<cmd>bd<CR>')
vim.keymap.set('n', '<leader>E', '<cmd>Sexp<CR>')
vim.keymap.set('n', '<BS>', '<cmd>b#<CR>')
vim.keymap.set('n', '<leader>l', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fe', '<cmd>Telescope find_files<CR>', {})
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope git_files<CR>', {})
vim.keymap.set('n', '<leader>f/', '<cmd>Telescope live_grep<CR>', {})
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', {})

vim.keymap.set('n', ']q', '<cmd>cnext<CR>', {})
vim.keymap.set('n', '[q', '<cmd>cprev<CR>', {})
vim.keymap.set('n', ']Q', '<cmd>clast<CR>', {})
vim.keymap.set('n', '[Q', '<cmd>cfirst<CR>', {})
vim.keymap.set('n', ']w', '<cmd>lnext<CR>', {})
vim.keymap.set('n', '[w', '<cmd>lprev<CR>', {})
vim.keymap.set('n', ']W', '<cmd>llast<CR>', {})
vim.keymap.set('n', '[W', '<cmd>lfirst<CR>', {})


-- Diagnostic keymaps
vim.keymap.set('n', '[d',        vim.diagnostic.goto_prev,  { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d',        vim.diagnostic.goto_next,  { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })


vim.keymap.set('n', '[g',        '<cmd>Gitsigns prev_hunk<CR>',  { desc = "Previous git hunk" })
vim.keymap.set('n', ']g',        '<cmd>Gitsigns next_hunk<CR>',  { desc = "Next git hunk" })

-- visual mode shifting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Lang mappings
vim.o.keymap = 'greek_utf-8'
vim.o.iminsert = 0
vim.o.imsearch = 0 -- TODO try -1 here
vim.keymap.set('i', '<A-S-L>', '<C-^>',
	{ desc = "Switch language-mapping and refresh statusline" })
vim.keymap.set('n', '<A-S-L>', function()
		vim.o.iminsert = (vim.o.iminsert == 1) and 0 or 1
	end, { desc = "Switch language-mapping and refresh statusline" })

-- The default el dict has not been updated since https://github.com/vim/vim/issues/299
-- el dict should be generated
-- Spell mappings :h spell :h [s
vim.opt.spelllang = "en,el"
vim.keymap.set('n', '<F2>', '<cmd>setl spell! spell?<CR>')
vim.keymap.set('i', '<F2>', '<cmd>setl spell!<CR>')
vim.keymap.set('n', '<leader>s', '1z=]s', { desc = "Fix spell under cursor and go to next misspelled word" })
vim.keymap.set('n', '<leader>S', [[<cmd>%s/σ\>/ς/Ig<cr>]])


-- zoom a vim pane, <C-w>= to re-balance
vim.keymap.set('n', '<leader>-', [[<cmd>wincmd _<cr><cmd>wincmd |<cr>]])
vim.keymap.set('n', '<leader>=', [[<cmd>wincmd =<cr>]])

-- resize panes
vim.keymap.set('n', '<Right>', '<cmd>vertical resize +5<cr>')
vim.keymap.set('n', '<Left>', '<cmd>vertical resize -5<cr>')
vim.keymap.set('n', '<Up>', '<cmd>resize +5<cr>')
vim.keymap.set('n', '<Down>', '<cmd>resize -5<cr>')

-- alt - {hjkl} window navigation. See :h terminal-input
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('i', '<A-h>', [[<C-\><C-n><C-w>h]])
vim.keymap.set('i', '<A-j>', [[<C-\><C-n><C-w>j]])
vim.keymap.set('i', '<A-k>', [[<C-\><C-n><C-w>k]])
vim.keymap.set('i', '<A-l>', [[<C-\><C-n><C-w>l]])
vim.keymap.set('t', '<A-h>', [[<C-\><C-n><C-w>h]])
vim.keymap.set('t', '<A-j>', [[<C-\><C-n><C-w>j]])
vim.keymap.set('t', '<A-k>', [[<C-\><C-n><C-w>k]])
vim.keymap.set('t', '<A-l>', [[<C-\><C-n><C-w>l]])
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.keymap.set('t', '<C-R>', [['<C-\><C-N>"'.nr2char(getchar()).'pi']], { expr = true })
vim.keymap.set('n', '<C-c><C-c>', '<cmd>split term://bash<CR>i')
