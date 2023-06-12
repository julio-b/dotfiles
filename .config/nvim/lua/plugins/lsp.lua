return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ 'j-hui/fidget.nvim', opts = {}, tag = 'legacy' }, -- show lsp status messages
		'folke/neodev.nvim',                -- specific lua_ls setting for neovim
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		-- Setup language servers.
		require('neodev').setup {}

		local on_attach = function(_, bufnr)
			local nmap = function(keys, func, desc)
				if desc then
					desc = 'LSP: ' .. desc
				end

				vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
			end

			nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
			nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

			nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
			nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
			nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
			nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
			nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols,
				'[D]ocument [S]ymbols')

			nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
			nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

			-- TODO Change keymaps, <leader>w is used to save file
			-- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
			-- 	'[W]orkspace [S]ymbols')
			-- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
			-- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
			-- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
			-- nmap('<leader>wl', function()
			-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			-- end, '[W]orkspace [L]ist Folders')

			-- consider removing this, formatexpr might be enough 
			-- Create a command `:Format` local to the LSP buffer
			vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
				vim.lsp.buf.format { async = true }
			end, { desc = 'Format current buffer with LSP' })
		end

		local servers = {
			bashls = {
				--[[ TODO PKGBUILD specific shellcheck  ]]
				-- cmd_env = { SHELLCHECK_PATH = '/usr/bin/shellcheck' },
				settings = {
					bashIde = {
						shellcheckPath = '/usr/bin/shellcheck',
						shellcheckArguments = "--exclude=SC2034,SC2154,SC2164",
					}
				},
			},
			html = {}, -- TODO json css
			clangd = {},
			lua_ls = {
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			},
			gopls = {},
			pylsp = {
				settings = {
					pylsp = {
						plugins = {
							pycodestyle = {
								ignore = { 'W391' },
								maxLineLength = 100
							}
						}
					}
				}
			},
		}


		local lspconfig = require('lspconfig')

		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

		for server, conf in pairs(servers) do
			conf.capabilities = capabilities
			conf.on_attach = on_attach
			lspconfig[server].setup(conf)
		end
	end,
}
