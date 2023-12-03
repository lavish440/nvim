local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"VonHeikemen/lsp-zero.nvim",
		lazy = false,
		priority = 1000,
	},
	{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
	"nvim-lua/plenary.nvim",
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
		},
	},
	"folke/todo-comments.nvim",
	"icewind/ltex-client.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"jay-babu/mason-null-ls.nvim",
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	},
	"onsails/lspkind.nvim",
	{ "williamboman/mason.nvim", build = ":MasonUpdate" }, -- :MasonUpdate updates registry contents,
	{
		"williamboman/mason-lspconfig.nvim",
	},
	"nvim-telescope/telescope.nvim",
	"sharkdp/fd",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/playground",
	"kyazdani42/nvim-web-devicons",
	"morhetz/gruvbox",
	"tanvirtin/monokai.nvim",
	-- { "sonph/onehalf",                rtp = "vim" },
	"kyazdani42/nvim-tree.lua",
	"nvim-lualine/lualine.nvim",
	"windwp/nvim-autopairs",
	"numtostr/comment.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"ethanholz/nvim-lastplace",
	"godlygeek/tabular",
	"preservim/vim-markdown",
	"tpope/vim-repeat",
	"tpope/vim-surround",
	"maxbrunsfeld/vim-yankstack",
	"Pocco81/true-zen.nvim",
	"lambdalisue/suda.vim",
	"hrsh7th/nvim-cmp",
	"quangnguyen30192/cmp-nvim-ultisnips",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	{ "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },
	"windwp/nvim-ts-autotag",
	"lervag/vimtex",
	"folke/which-key.nvim",
	"tjdevries/gruvbuddy.nvim",
	"tjdevries/colorbuddy.vim",
	{ "SirVer/ultisnips" },
	"rafamadriz/neon",
	"Mofiqul/vscode.nvim",
	"marko-cerovac/material.nvim",
	"folke/tokyonight.nvim",
	"sainnhe/sonokai",
	"akinsho/bufferline.nvim",
	"gennaro-tedesco/nvim-peekup",
	"lewis6991/spellsitter.nvim",
	"goolord/alpha-nvim",
	"karb94/neoscroll.nvim",
	"akinsho/toggleterm.nvim",
	"mfussenegger/nvim-dap",
	"Pocco81/DAPInstall.nvim",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",
	"mfussenegger/nvim-dap-python",
	"nvim-telescope/telescope-dap.nvim",
	-- { "folke/neodev.nvim", opt = true },
	"CRAG666/code_runner.nvim",
	{ "stevearc/dressing.nvim" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "stevearc/overseer.nvim" },
	"lewis6991/gitsigns.nvim",
	"sindrets/diffview.nvim",
	"tpope/vim-fugitive",
	"nvimdev/lspsaga.nvim",
	--  'emakman/nvim-latex-previewer'
	--  'vimjas/vim-python-pep8-indent'
	--  'vim-scripts/peaksea'
	--  'psliwka/vim-smoothie'
	--  'jlanzarotta/bufexplorer'
})
