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
	showDiagOnStatusLine: true,
	showInlayHints: true,
	diagVirtualTextAlign: 'after',
	showSignature: true,
	ignoreMissingServer: true,
	}

g:LspOptionsSet(lspOpts)
g:LspAddServer(lspServers)

def SetupLspMaps()
	nnoremap <buffer> <Leader>gD <cmd>LspGotoDeclaration<CR>
	nnoremap <buffer> <Leader>gd <cmd>LspGotoDefinition<CR>
	nnoremap <buffer> <Leader>gi <cmd>LspGotoImpl<CR>
	nnoremap <buffer> <Leader>gr <cmd>LspShowReferences<CR>

	nnoremap <buffer> <Leader>pD <cmd>LspPeekDeclaration<CR>
	nnoremap <buffer> <Leader>pd <cmd>LspPeekDefinition<CR>
	nnoremap <buffer> <Leader>pi <cmd>LspPeekImpl<CR>
	nnoremap <buffer> <Leader>pr <cmd>LspPeekReferences<CR>

	nnoremap <buffer> <Leader>rn <cmd>LspRename<CR>
	nnoremap <buffer> <Leader>ca <cmd>LspCodeAction<CR>

	nnoremap <buffer> [e         <cmd>LspDiag prev<CR>
	nnoremap <buffer> ]e         <cmd>LspDiag next<CR>
	nnoremap <buffer> [E         <cmd>LspDiag first<CR>
	nnoremap <buffer> ]E         <cmd>LspDiag last<CR>
	nnoremap <buffer> <leader>e  <cmd>LspDiag here<CR>
	nnoremap <buffer> <leader>E  <cmd>LspDiag show<CR>

	nnoremap <buffer> <leader>sl call lsp.StopAllServers()
	setlocal tagfunc=lsp#lsp#TagFunc
	setlocal formatexpr=lsp#lsp#FormatExpr()
	setlocal keywordprg=:LspHover
enddef

autocmd User LspAttached SetupLspMaps()
