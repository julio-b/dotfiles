vim9script

var lspServers = [
	{
		name: 'clang',
		filetype: ['c', 'cpp'],
		path: '/usr/bin/clangd',
		runUnlessSearch: ['.git/DISABLE_CLANGD'],
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
		name: 'vscode-html-server',
		filetype: ['html'],
		path: '/usr/bin/vscode-html-language-server',
		args: ['--stdio'],
		initializationOptions: {
			settings: {
				html: {
					format: {
						templating: true,
						wrapLineLength: 120,
						wrapAttributes: 'auto',
					},
					hover: {
						documentation: true,
						references: true,
					},
				},
			}
		}
	},
	{
		name: 'vscode-eslint-server',
		filetype: ['javascript'],
		path: '/usr/bin/vscode-eslint-language-server',
		args: ['--stdio'],
	},
	{
		name: 'bashls',
		filetype: ['sh', 'bash'],
		path: '/usr/bin/bash-language-server',
		args: ['start'],
		workspaceConfig: {
			bashIde: {
				shellcheckArguments: "--extended-analysis=false --exclude=SC2034,SC2154,SC2164",
			}
		},
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
