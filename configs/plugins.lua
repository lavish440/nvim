vim.opt.fillchars = { eob = " " }
vim.opt.termguicolors = true

require("bufferline").setup({})

require("Comment").setup()

require("neoscroll").setup()

require("alpha").setup(require("alpha.themes.dashboard").config)

require("colorbuddy").setup()

require("nvim-lastplace").setup({})

require("nvim-autopairs").setup({
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from Pattern Match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Pmenusel",
		highlight_grey = "LineNr",
	},
})

require("spellsitter").setup({
	-- Whether enabled, can be a list of filetypes, e.g. {'python', 'lua'}
	enable = true,
	debug = false,
})

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { all },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recomendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "phpdoc" },

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- disable = { "c", "rust" },

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})

require("nvim-tree").setup({
	-- sort_by = "case_sensitive",
	-- auto_reload_on_write = true,
	-- hijack_netrw = true,
	-- view = {
	-- 	adaptive_size = true,
	-- 	mappings = {
	-- 		list = {
	-- 			{ key = "u", action = "dir_up" },
	-- 		},
	-- 	},
	-- },
	-- renderer = {
	-- 	group_empty = true,
	-- },
	-- filters = {
	-- 	dotfiles = true,
	-- },
	on_attach = on_attach,
})

--
-- This function has been generated from your
--   view.mappings.list
--   view.mappings.custom_only
--   remove_keymaps
--
-- You should add this function to your configuration and set on_attach = on_attach in the nvim-tree setup call.
--
-- Although care was taken to ensure correctness and completeness, your review is required.
--
-- Please check for the following issues in auto generated content:
--   "Mappings removed" is as you expect
--   "Mappings migrated" are correct
--
-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
--

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- Default mappings. Feel free to modify or remove as you wish.
	--
	-- BEGIN_DEFAULT_ON_ATTACH
	vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
	vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
	vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
	vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
	vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
	vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
	vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
	vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "a", api.fs.create, opts("Create"))
	vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
	vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
	vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
	vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
	vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
	vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
	vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
	vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
	vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
	vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
	vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
	vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
	vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
	vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
	vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
	vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
	vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
	vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
	vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
	vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
	vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
	vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
	vim.keymap.set("n", "q", api.tree.close, opts("Close"))
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
	vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
	vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
	vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
	vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
	vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
	vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
	vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
	-- END_DEFAULT_ON_ATTACH

	-- Mappings migrated from view.mappings.list
	--
	-- You will need to insert "your code goes here" for any mappings with a custom action_cb
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "sonokai",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"buffers",
				show_filename_only = true, -- Shows shortened relative path when set to false.
				hide_filename_extension = false, -- Hide filename extension when set to true.
				show_modified_status = true, -- Shows indicator when the buffer is modified.

				-- mode = 0, -- 0: Shows buffer name
				-- 1: Shows buffer index
				-- 2: Shows buffer name + buffer index
				-- 3: Shows buffer number
				-- 4: Shows buffer name + buffer number

				max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
				-- it can also be a function that returns
				-- the value of `max_length` dynamically.
				filetype_names = {
					TelescopePrompt = "Telescope",
					dashboard = "Dashboard",
					packer = "Packer",
					fzf = "FZF",
					alpha = "Alpha",
				}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

				-- buffers_color = { -- Same values as the general color option can be used here.
				--	 active = 'lualine_{section}_normal',	  -- Color for active buffer.
				--	 inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
				-- },

				symbols = {
					modified = " + ", -- Text to show when the buffer is modified
					alternate_file = "#", -- Text to show to identify the alternate file
					directory = "", -- Text to show when the buffer is a directory
				},
			},
			{ "branch", icon = { "", align = "right", color = { fg = "green" } } },
			{
				"diff",
				colored = true, -- Displays a colored diff status if set to true
				diff_color = {
					-- Same color values as the general color option can be used here.
					added = "DiffAdd", -- Changes the diff's added color
					modified = "DiffChange", -- Changes the diff's modified color
					removed = "DiffDelete", -- Changes the diff's removed color you
				},
				symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
				source = nil, -- A function that works as a data source for diff.
				-- It must return a table as such:
				--   { added = add_count, modified = modified_count, removed = removed_count }
				-- or nil on failure. count <= 0 won't be displayed.
			},
			-- {
			-- 	"diagnostics",
			-- 	--
			-- 	-- 	-- Table of diagnostic sources, available sources are:
			-- 	-- 	--	 'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
			-- 	-- 	-- or a function that returns a table as such:
			-- 	-- 	--	 { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
			-- 	sources = { "nvim_diagnostic" },
			-- 	--
			-- 	-- 	-- Displays diagnostics for the defined severity types
			-- 	sections = { "error", "warn", "info", "hint" },
			-- 	--
			-- 	-- diagnostics_color = {
			-- 	-- 	-- 		-- Same values as the general color option can be used here.
			-- 	-- 	error = "DiagnosticError", -- Changes diagnostics' error color.
			-- 	-- 	warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
			-- 	-- 	info = "DiagnosticInfo", -- Changes diagnostics' info color.
			-- 	-- 	hint = "DiagnosticHint", -- Changes diagnostics' hint color.
			-- 	-- },
			-- 	symbols = { error = " ", warn = " ", info = " ", hint = " " },
			-- 	-- symbols = { error = " ", warn = " ", hint = " ", info = " " },
			-- 	colored = true, -- Displays diagnostics status in color if set to true.
			-- 	update_in_insert = false, -- Update diagnostics in insert mode.
			-- 	always_visible = false, -- Show diagnostics even if there are none.
			-- },
		},
		lualine_c = {
			{
				"diagnostics",
				--
				-- 	-- Table of diagnostic sources, available sources are:
				-- 	--	 'nvim_lsp', 'nvim_diagnostic', 'coc', 'ale', 'vim_lsp'.
				-- 	-- or a function that returns a table as such:
				-- 	--	 { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
				source = { "nvim" },
				--
				-- 	-- Displays diagnostics for the defined severity types
				sections = { "error", "warn", "info", "hint" },
				--
				-- diagnostics_color = {
				-- 	-- 		-- Same values as the general color option can be used here.
				-- 	error = "DiagnosticError", -- Changes diagnostics' error color.
				-- 	warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
				-- 	info = "DiagnosticInfo", -- Changes diagnostics' info color.
				-- 	hint = "DiagnosticHint", -- Changes diagnostics' hint color.
				-- },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				-- symbols = { error = " ", warn = " ", hint = " ", info = " " },
				colored = true, -- Displays diagnostics status in color if set to true.
				update_in_insert = false, -- Update diagnostics in insert mode.
				always_visible = false, -- Show diagnostics even if there are none.
			},
		},
		lualine_x = { "filetype" },
		-- lualine_y = {"location"},
		-- lualine_z = {"%l:%c"},
	},
})

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	show_keys = true,
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
		-- disable the WhichKey popup for certain buf types and file types
		-- Disabled by default for Telescope
		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	},
}
local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
	},
}
local mappings = {
	-- ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	-- ["b"] = {
	-- "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	-- "Buffers",
	-- },
	-- ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	-- ["w"] = { "<cmd>w!<CR>", "Save" },
	-- ["q"] = { "<cmd>q!<CR>", "Quit" },
	-- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	-- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	-- ["f"] = {
	-- "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	-- "Find files",
	-- },
	[";"] = { "<cmd>Alpha<CR>", "Dashboard" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>confirm q<CR>", "Quit" },
	["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
	["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },

	d = {
		name = "Debug",
		t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
		d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
		U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
	},
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	-- g = {
	-- 	name = "Git",
	-- 	g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
	-- 	j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
	-- 	k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
	-- 	l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
	-- 	p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
	-- 	r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
	-- 	R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
	-- 	s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
	-- 	u = {
	-- 		"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
	-- 		"Undo Stage Hunk",
	-- 	},
	-- 	o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
	-- 	b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	-- 	c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
	-- 	d = {
	-- 		"<cmd>Gitsigns diffthis HEAD<cr>",
	-- 		"Diff",
	-- 	},
	-- },

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
		w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
		f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		l = { "<cmd>Telescope resume<cr>", "Resume last search" },
		p = {
			"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
			"Colorscheme with Preview",
		},
	},

	T = {
		name = "Treesitter",
		i = { ":TSConfigInfo<cr>", "Info" },
	},

	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
-- local Rule = require("nvim-autopairs.rule")
-- local npairs = require("nvim-autopairs")
-- local cond = require("nvim-autopairs.conds")
-- print(vim.inspect(cond))

-- npairs.add_rules(
-- 	{
-- 		Rule("$", "$", { "tex", "latex" })
-- 			-- don't add a pair if the next character is %
-- 			:with_pair(cond.not_after_regex("%%"))
-- 			-- don't add a pair if	the previous character is xxx
-- 			:with_pair(cond.not_before_regex("xxx", 3))
-- 			-- don't move right when repeat character
-- 			:with_move(cond.none())
-- 			-- don't delete if the next character is xx
-- 			:with_del(cond.not_after_regex("xx"))
-- 			-- disable adding a newline when you press <cr>
-- 			:with_cr(cond.none()),
-- 	},
-- 	-- disable for .vim files, but it work for another filetypes
-- 	Rule("a", "a", "-vim")
-- )

-- npairs.add_rules({
--	 Rule("$$","$$","tex")
--	   jwith_pair(function(opts)
--		   print(vim.inspect(opts))
--		   if opts.line=="aa $$" then
--		   -- don't add pair on that line
--			 return false
--		   end
--	   end)
--	  }
-- )

vim.opt.list = true
vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "tab:»"
-- vim.opt.listchars = { tab = '»' }

-- require("indent_blankline").setup({
-- 	-- for example, context is off by default, use this to turn it on
-- 	show_first_indent_level = true,
-- 	show_current_context = true,
-- 	show_current_context_start = true,
-- 	show_end_of_line = true,
-- 	-- space_char_blankline = " ",
-- 	use_treesitter = true,
-- 	char_highlight_list = {
-- 		"IndentBlanklineIndent3",
-- 	},
-- })

require("ibl").setup({
	debounce = 100,
	-- indent = { char = "|" },
	indent = { tab_char = { "▎" } },
	whitespace = { highlight = { "Whitespace", "NonText", "Function", "Label" } },
})

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
	node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
	ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
	htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
	python:toggle()
end

local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	-- if client.server_capabilities.inlayHintProvider then
	-- 	vim.lsp.buf.inlay_hint(bufnr, true)
	-- end
	lsp_zero.default_keymaps({ buffer = bufnr })
end)
local lspconfig = require("lspconfig")
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities =
	vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- lspconfig.lua_ls.setup({})
-- lspconfig.jedi_language_server.setup({})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
	},
})
-- lsp.nvim_workspace()
-- lsp.setup()

-- local lsp = require('lsp-zero').preset({})

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
})

-- require("cmp_nvim_ultisnips").setup({})

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
	sources = {
		-- completion.spell,
		diagnostics.cpplint.with({ args = { "--filter=-legal/copyright", "$FILENAME" } }),
		-- diagnostics.cppcheck,
		diagnostics.erb_lint,
		-- diagnostics.eslint_d,
		-- diagnostics.flake8,
		diagnostics.luacheck.with({
			args = { "--formatter", "plain", "--codes", "--ranges", "--filename", "$FILENAME", "-", "--globals", "vim" },
		}),
		diagnostics.pylint.with({ extra_args = { "--disable=C0114" } }),
		-- diagnostics.selene,
		diagnostics.stylelint.with({
			extra_args = {
				"--config",
				"/home/lavish/.local/share/nvim/mason/packages/stylelint/node_modules/stylelint/.stylelintrc.json",
				"--config-basedir",
				"/home/lavish/.local/share/nvim/mason/packages/stylelint/node_modules/stylelint/node_modules/stylelint-config-recommended",
			},
		}),
		diagnostics.vint,
		-- diagnostics.ruff,
		-- diagnostics.vale,
		formatting.autoflake,
		formatting.black,
		formatting.beautysh,
		formatting.clang_format,
		formatting.jq,
		formatting.latexindent,
		formatting.prettierd,
		formatting.stylelint.with({
			args = {
				"--config",
				"/home/lavish/.local/share/nvim/mason/packages/stylelint/node_modules/stylelint/.stylelintrc.json",
				"--config-basedir",
				"/home/lavish/.local/share/nvim/mason/packages/stylelint/node_modules/stylelint/node_modules/stylelint-config-recommended",
				"--fix",
				"--stdin",
				"-f",
				"json",
				"--stdin-filename",
				"$FILENAME",
			},
		}),
		formatting.stylua,
		-- formatting.xmlformat,
		formatting.xmllint,
		-- formatting.yapf,
		-- null_ls.builtins.completion.spell,
		null_ls.builtins.code_actions.gitsigns,
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local key_opts = { buffer = true }
			vim.keymap.set(mode, lhs, rhs, key_opts)
		end

		-- Displays hover information about the symbol under the cursor
		-- bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

		-- Jump to the definition
		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

		-- Jump to declaration
		bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

		-- Lists all the implementations for the symbol under the cursor
		bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

		-- Jumps to the definition of the type symbol
		bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

		-- Lists all the references
		bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

		-- Displays a function's signature information
		bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

		-- Renames all references to the symbol under the cursor
		bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")

		-- Selects a code action available at the current cursor position
		bufmap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		bufmap("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")

		-- Show diagnostics in a floating window
		bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

		-- Move to the previous diagnostic
		bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

		-- Move to the next diagnostic
		bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	end,
})

-- require("neodev").setup({
-- 	library = { plugins = { "nvim-dap-ui" }, types = true },
-- })

local dap = require("dap")

local dapui = require("dapui")
require("dapui").setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

dap.adapters.codelldb = {
	-- name = "codelldb server",
	type = "server",
	port = "${port}",
	executable = {
		command = "/home/lavish/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
		args = { "--port", "${port}" },
	},
}

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "/home/lavish/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
	{
		name = "Launch File",
		type = "codelldb",
		request = "launch",
		program = function()
			-- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			return vim.fn.expand("%:p:r")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		-- args = {},
		-- runInTerminal = true,
		-- terminal = "integrated",
		-- stopAtEntry = true,
	},
	-- {
	-- 	name = "Attach to gdbserver :1234",
	-- 	type = "cppdbg",
	-- 	request = "launch",
	-- 	MIMode = "gdb",
	-- 	miDebuggerServerAddress = "localhost:1234",
	-- 	miDebuggerPath = "/usr/bin/gdb",
	-- 	cwd = "${workspaceFolder}",
	-- 	program = function()
	-- 		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	-- 	end,
	-- },
}

dap.configurations.c = dap.configurations.cpp
dap.defaults.fallback.focus_terminal = true

require("ltex-client").setup()
require("todo-comments").setup({
	highlight = {
		exclude = { "log" },
	},
	search = {
		pattern = [[\b(KEYWORDS)\b]],
	},
})

require("code_runner").setup({
	-- startinsert = true,
	mode = "toggleterm",
	filetype = {
		-- java = {
		--   "cd $dir &&",
		--   "javac $fileName &&",
		--   "java $fileNameWithoutExt"
		-- },
		python = "python3 -u",
		typescript = "deno run",
		rust = {
			"cd $dir &&",
			"rustc $fileName &&",
			"$dir/$fileNameWithoutExt",
		},
		cpp = {
			"cd $dir &&",
			"g++ -g $fileName -o $fileNameWithoutExt &&",
			"$dir/$fileNameWithoutExt",
		},
	},
})
vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

require("telescope").load_extension("ui-select")

require("overseer").setup({
	templates = { --[[  "builtin" ,]]
		"cll.js",
		"cll.html",
		"cll.pyt",
		"cll.build",
		"cll.debug",
		"cll.run",
	},
	strategy = {
		"toggleterm",
		-- load your default shell before starting the task
		use_shell = false,
		-- overwrite the default toggleterm "direction" parameter
		direction = nil,
		-- overwrite the default toggleterm "highlights" parameter
		highlights = nil,
		-- overwrite the default toggleterm "auto_scroll" parameter
		auto_scroll = nil,
		-- have the toggleterm window close and delete the terminal buffer
		-- automatically after the task exits
		close_on_exit = false,
		-- have the toggleterm window close without deleting the terminal buffer
		-- automatically after the task exits
		-- can be "never, "success", or "always". "success" will close the window
		-- only if the exit code is 0.
		quit_on_exit = "never",
		-- open the toggleterm window when a task starts
		open_on_start = true,
		-- mirrors the toggleterm "hidden" parameter, and keeps the task from
		-- being rendered in the toggleable window
		hidden = false,
		-- command to run when the terminal is created. Combine with `use_shell`
		-- to run a terminal command before starting the task
		on_create = nil,
	},
})

vim.keymap.set("n", "<F5>", ":OverseerRun<CR>", { noremap = true, silent = false })
require("dressing").setup({
	input = {
		-- Set to false to disable the vim.ui.input implementation
		enabled = true,

		-- Default prompt string
		default_prompt = "Input:",

		-- Can be 'left', 'right', or 'center'
		title_pos = "left",

		-- When true, <Esc> will close the modal
		insert_only = true,

		-- When true, input will start in insert mode.
		start_in_insert = true,

		-- These are passed to nvim_open_win
		-- anchor = "SW",
		border = "rounded",
		-- 'editor' and 'win' will default to being centered
		relative = "cursor",

		-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		prefer_width = 40,
		width = nil,
		-- min_width and max_width can be a list of mixed types.
		-- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
		max_width = { 140, 0.9 },
		min_width = { 20, 0.2 },

		buf_options = {},
		win_options = {
			-- Window transparency (0-100)
			winblend = 10,
			-- Disable line wrapping
			wrap = false,
			-- Indicator for when text exceeds window
			list = true,
			listchars = "precedes:…,extends:…",
			-- Increase this for more context when text scrolls off the window
			sidescrolloff = 0,
		},

		-- Set to `false` to disable
		mappings = {
			n = {
				["<Esc>"] = "Close",
				["<CR>"] = "Confirm",
			},
			i = {
				["<C-c>"] = "Close",
				["<CR>"] = "Confirm",
				["<Up>"] = "HistoryPrev",
				["<Down>"] = "HistoryNext",
			},
		},

		override = function(conf)
			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			return conf
		end,

		-- see :help dressing_get_config
		get_config = nil,
	},
	select = {
		-- Set to false to disable the vim.ui.select implementation
		enabled = true,

		-- Priority list of preferred vim.select implementations
		backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

		-- Trim trailing `:` from prompt
		trim_prompt = true,

		-- Options for telescope selector
		-- These are passed into the telescope picker directly. Can be used like:
		-- telescope = require('telescope.themes').get_ivy({...})
		telescope = nil,

		-- Options for fzf selector
		fzf = {
			window = {
				width = 0.5,
				height = 0.4,
			},
		},

		-- Options for fzf-lua
		fzf_lua = {
			-- winopts = {
			--   height = 0.5,
			--   width = 0.5,
			-- },
		},

		-- Options for nui Menu
		nui = {
			position = "50%",
			size = nil,
			relative = "editor",
			border = {
				style = "rounded",
			},
			buf_options = {
				swapfile = false,
				filetype = "DressingSelect",
			},
			win_options = {
				winblend = 10,
			},
			max_width = 80,
			max_height = 40,
			min_width = 40,
			min_height = 10,
		},

		-- Options for built-in selector
		builtin = {
			-- These are passed to nvim_open_win
			-- anchor = "NW",
			border = "rounded",
			-- 'editor' and 'win' will default to being centered
			relative = "editor",

			buf_options = {},
			win_options = {
				-- Window transparency (0-100)
				winblend = 10,
			},

			-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- the min_ and max_ options can be a list of mixed types.
			-- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
			width = nil,
			max_width = { 140, 0.8 },
			min_width = { 40, 0.2 },
			height = nil,
			max_height = 0.9,
			min_height = { 10, 0.2 },

			-- Set to `false` to disable
			mappings = {
				["<Esc>"] = "Close",
				["<C-c>"] = "Close",
				["<CR>"] = "Confirm",
			},

			override = function(conf)
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				return conf
			end,
		},

		-- Used to override format_item. See :help dressing-format
		format_item_override = {},

		-- see :help dressing_get_config
		get_config = nil,
	},
})

-- vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
--
-- vim.fn.sign_define(
-- 	"DapBreakpoint",
-- 	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )
-- vim.fn.sign_define(
-- 	"DapBreakpointCondition",
-- 	{ text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )
-- vim.fn.sign_define(
-- 	"DapBreakpointRejected",
-- 	{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )
-- vim.fn.sign_define(
-- 	"DapLogPoint",
-- 	{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
-- )
-- vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
--
vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "•", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "•", texthl = "blue", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "•", texthl = "orange", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define("DapStopped", { text = "•", texthl = "green", linehl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define(
	"DapLogPoint",
	{ text = "•", texthl = "yellow", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<leader>hs", gs.stage_hunk)
		map("n", "<leader>hr", gs.reset_hunk)
		map("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("n", "<leader>hS", gs.stage_buffer)
		map("n", "<leader>hu", gs.undo_stage_hunk)
		map("n", "<leader>hR", gs.reset_buffer)
		map("n", "<leader>hp", gs.preview_hunk)
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame)
		map("n", "<leader>hd", gs.diffthis)
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

require("lspsaga").setup({})
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
require("nvim-ts-autotag").setup()
require("competitest").setup()

-- require("lspconfig").html.setup({
-- 	cmd = { "vscode-html-language-server", "--stdio" },
-- 	capabilities = capabilities,
-- })
require("lspconfig").html.setup({
	on_attach = function(client)
		capabilities = capabilities
	end,
})
require("lspconfig").cssls.setup({
	on_attach = function(client)
		capabilities = capabilities
	end,
})
