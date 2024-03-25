vim9script

var lspServers = [
	{
		name: 'clang',
		filetype: ['c', 'cpp'],
		path: '/usr/bin/clangd',
		args: ['--background-index', '--clang-tidy']
	},
	{
		name: 'golang',
		filetype: ['go', 'gomod'],
		path: '/usr/bin/gopls',
		args: ['serve'],
		syncInit: true,
	},
	{
		name: 'bashls',
		filetype: ['sh', 'bash'],
		path: '/usr/bin/bash-language-server',
		args: ['start'],
	}]

var lspOpts = {
	completionMatcher: 'fuzzy',
	showDiagWithVirtualText: true,
	#showDiagOnStatusLine: true,
	#showInlayHints: true,
	}

g:LspAddServer(lspServers)
g:LspOptionsSet(lspOpts)

def SetupLspMaps()
	nnoremap <buffer> <Leader>ca <cmd>LspCodeAction<CR>
	nnoremap <buffer> <Leader>gd <cmd>LspGotoDeclaration<CR>
	nnoremap <buffer> <Leader>gD <cmd>LspGotoDefinition<CR>
	nnoremap <buffer> <Leader>gi <cmd>LspGotoImpl<CR>
	nnoremap <buffer> <Leader>gr <cmd>LspShowReferences<CR>
	nnoremap <buffer> <Leader>rn <cmd>LspRename<CR>
	nnoremap <buffer> [e         <cmd>LspDiagPrev<CR>
	nnoremap <buffer> ]e         <cmd>LspDiagNext<CR>
	nnoremap <buffer> [E         <cmd>LspDiagFirst<CR>
	nnoremap <buffer> ]E         <cmd>LspDiagLast<CR>
	nnoremap <buffer> <leader>e  <cmd>LspDiagHere<CR>
	nnoremap <buffer> <leader>E  <cmd>LspDiagShow<CR>

	setlocal tagfunc=lsp#lsp#TagFunc
	setlocal formatexpr=lsp#lsp#FormatExpr()
enddef

autocmd User LspAttached SetupLspMaps()
