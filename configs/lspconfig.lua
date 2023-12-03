-- vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

-- require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
-- local luasnip = require("luasnip")
local cmp_kinds = {
	Array = " ",
	Boolean = " ",
	Class = " ",
	Color = " ",
	Constant = " ",
	Constructor = " ",
	Enum = " ",
	EnumMember = " ",
	Event = " ",
	Field = " ",
	File = " ",
	Folder = "󰉋 ",
	Function = " ",
	Interface = " ",
	Key = " ",
	Keyword = " ",
	Method = " ",
	Module = " ",
	Namespace = " ",
	Null = "󰟢 ",
	Number = " ",
	Object = " ",
	Operator = " ",
	Package = " ",
	Property = " ",
	Reference = " ",
	Snippet = " ",
	String = " ",
	Struct = " ",
	Text = " ",
	TypeParameter = " ",
	Unit = " ",
	Value = " ",
	Variable = " ",
}

local select_opts = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	completion = {
		completeopt = "menu,menuone,insert,noselect",
	},

	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	sources = {
		{ name = "path", option = { trailing_slash = true } },
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "nvim_lua", keyword_length = 1 },
		{
			name = "buffer",
			keyword_length = 1,
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{ name = "ultisnips", keyword_length = 1 },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				luasnip = "⋗",
				buffer = "Ω",
				path = "🖫",
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item(select_opts),
		["<Down>"] = cmp.mapping.select_next_item(select_opts),

		["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
		["<C-n>"] = cmp.mapping.select_next_item(select_opts),

		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),

		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		["<C-f>"] = cmp.mapping(function(fallback)
			cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
		end, {
			"i",
			"s", --[[ "c" (to enable the mapping in command mode) ]]
		}),

		["<C-b>"] = cmp.mapping(function(fallback)
			cmp_ultisnips_mappings.jump_backwards(fallback)
		end, {
			"i",
			"s", --[[ "c" (to enable the mapping in command mode) ]]
		}),

		["<Tab>"] = cmp.mapping(function(fallback)
			local col = vim.fn.col(".") - 1

			if cmp.visible() then
				cmp.select_next_item()
			elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
				fallback()
			else
				cmp.complete()
				vim.wait(500, function()
					return cmp.visible()
				end)
				cmp.select_next_item()
			end
		end, { "i", "s" }),

		-- ['<Tab>'] = function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	else
		-- 		cmp.complete()
		-- 		vim.wait(500, function()
		-- 			return cmp.visible()
		-- 		end)
		-- 		cmp.select_next_item()
		-- 	end
		-- end,

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item(select_opts)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
})

-- local lspkind = require("lspkind")
cmp.setup({
	-- formatting = {
	--   format = lspkind.cmp_format({
	-- 	mode = 'symbol', -- show only symbol annotations
	-- 	maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
	-- 	ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
	-- 	menu = ({
	-- 		buffer = "[Buffer]",
	-- 		nvim_lsp = "[LSP]",
	-- 		luasnip = "[LuaSnip]",
	-- 		nvim_lua = "[Lua]",
	-- 		latex_symbols = "[Latex]",
	-- 	}),
	--
	--
	--     -- The function below will be called before any actual modifications from lspkind
	--     -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
	--     before = function (entry, vim_item)
	--       -- ...
	--       return vim_item
	--     end
	--   })
	-- }
	formatting = {
		format = function(_, vim_item)
			vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
			return vim_item
		end,
	},
})

-- formatting = {
--   format = lspkind.cmp_format({
--     mode = "symbol_text",
--     menu = ({
--       buffer = "[Buffer]",
--       nvim_lsp = "[LSP]",
--       luasnip = "[LuaSnip]",
--       nvim_lua = "[Lua]",
--       latex_symbols = "[Latex]",
--     })
--   }),
-- },

local signs = {
	Error = " ",
	Warn = " ",
	Info = " ",
	Hint = " ",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- require("lspconfig").pylsp.setup({
-- 	on_attach = function(client)
-- 		client.server_capabilities.diagnosticsProvider = false
-- 		-- client.server_capabilities.completionProvider = false
-- 		-- client.server_capabilities.hoverProvider = true
-- 	end,
-- })

require("lspconfig").pyright.setup({
	on_attach = function(client)
		client.server_capabilities.completionProvider = false
		client.server_capabilities.hoverProvider = false
	end,
})
local path = "/home/lavish/.config/nvim/spell/en.utf-8.add"
local words = {}

for word in io.open(path, "r"):lines() do
	table.insert(words, word)
end
require("lspconfig").ltex.setup({
	settings = {
		ltex = {
			dictionary = {
				["en-US"] = words,
				["en-GB"] = words,
			},
		},
	},
})

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- Disable the diagnostics
				enable = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
require("cmp_nvim_ultisnips").setup({
	filetype_source = "treesitter",
	show_snippets = "all",
	documentation = function(snippet)
		return snippet.description
	end,
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- 	requires = {
-- 		"quangnguyen30192/cmp-nvim-ultisnips",
-- 		config = function()
-- 			-- optional call to setup (see customization section)
-- 			require("cmp_nvim_ultisnips").setup({})
-- 		end,
-- 		-- If you want to enable filetype detection based on treesitter:
-- 		-- requires = { "nvim-treesitter/nvim-treesitter" },
-- 	},
-- 	config = function()
-- 		local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
-- 		require("cmp").setup({
-- 			snippet = {
-- 				expand = function(args)
-- 					vim.fn["UltiSnips#Anon"](args.body)
-- 				end,
-- 			},
-- 			sources = {
-- 				{ name = "ultisnips" },
-- 				-- more sources
-- 			},
-- 			-- recommended configuration for <Tab> people:
-- 			mapping = {
-- 				["<C-f>"] = cmp.mapping(function(fallback)
-- 					cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
-- 				end, {
-- 					"i",
-- 					"s", --[[ "c" (to enable the mapping in command mode) ]]
-- 				}),
-- 				["<C-b>"] = cmp.mapping(function(fallback)
-- 					cmp_ultisnips_mappings.jump_backwards(fallback)
-- 				end, {
-- 					"i",
-- 					"s", --[[ "c" (to enable the mapping in command mode) ]]
-- 				}),
-- 			},
-- 		})
-- 	end,
-- })
