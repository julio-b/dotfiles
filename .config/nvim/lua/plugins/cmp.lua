return {
	-- Autocompletion
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		{
			'L3MON4D3/LuaSnip',
			-- build = "make install_jsregexp"
		},
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		-- 'onsails/lspkind.nvim',
	},
	config = function()
		-- nvim-cmp setup
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local types = require("luasnip.util.types")

		luasnip.config.setup {
			history = true,
			updateevents = { "TextChanged", "TextChangedI" },
			enable_autosnippets = true,
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "●", "DiagnosticVirtualTextHint" } }

					}
				},
				[types.insertNode] = {
					active = {
						virt_text = { { "●", "DiagnosticVirtualTextInfo" } }
					}
				}
			},
		}

		cmp.setup {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			experimental = { ghost_text = { hl_group = "Comment" }, },

			mapping = cmp.mapping.preset.insert {
				["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
				["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-space>"] = cmp.mapping {
					i = cmp.mapping.complete(),
					c = function(_)
						if cmp.visible() then
							if not cmp.confirm { select = true } then
								return
							end
						else
							cmp.complete()
						end
					end,
				},
				["<tab>"] = cmp.config.disable,

				--[[luasnip mappings]]
				["<c-j>"] = cmp.mapping(
					function()
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						end
					end,
					{ "i", "s" }),
				["<c-k>"] = cmp.mapping(
					function()
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						end
					end,
					{ "i", "s" }),
				["<c-l>"] = cmp.mapping(
					function()
						if luasnip.choice_active() then
							luasnip.change_choice(1)
						end
					end,
					{ "i", "s" }),
				["<c-u>"] = cmp.mapping(
					function()
						if luasnip.choice_active() then
							require("luasnip.extras.select_choice")()
							-- require("luasnip.extras.snippet_list").open()
						end
					end,
					{ "i", "s" }),
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			}, {
				{ name = "buffer", keyword_length = 4 },
				{ name = "path" },
			}
			),

			-- formatting = {
			-- 	format = require('lspkind').cmp_format({
			-- 		mode = 'text_symbol',
			-- 		maxwidth = 50,
			-- 		ellipsis_char = '...',
			-- 		menu = {
			-- 			buffer = "[Buffer]",
			-- 			nvim_lsp = "[LSP]",
			-- 			luasnip = "[LuaSnip]",
			-- 			nvim_lua = "[Lua]",
			-- 			latex_symbols = "[Latex]",
			-- 		}
			-- 	}),
			-- },

		}
		--TODO
		-- cmp.setup.filetype('gitcommit', {
		-- 	sources = cmp.config.sources({
		-- 		{ name = 'cmp_git' },
		-- 		}, {
		-- 		{ name = 'buffer' },
		-- 	})
		-- })
		-- cmp.setup.cmdline('/', {
		-- 	mapping = cmp.mapping.preset.cmdline(),
		-- 	sources = {
		-- 		{ name = 'buffer' }
		-- 	}
		-- })
		--
		-- cmp.setup.cmdline(':', {
		-- 	mapping = cmp.mapping.preset.cmdline(),
		-- 	sources = cmp.config.sources({
		-- 		{ name = 'path' }
		-- 	}, {
		-- 		{ name = 'cmdline' }
		-- 	})
		-- })
	end
}
