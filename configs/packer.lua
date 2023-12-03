local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost packer.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({
		"L3MON4D3/LuaSnip",
		run = "make install_jsregexp",
	})
	use("nvim-lua/plenary.nvim")
	-- use 'quangnguyen30192/cmp-nvim-ultisnips'
	use("VonHeikemen/lsp-zero.nvim")
	use("folke/todo-comments.nvim")
	use("icewind/ltex-client.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")
	use({
		"xeluxee/competitest.nvim",
		requires = "MunifTanjim/nui.nvim",
	})
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})
	use("onsails/lspkind.nvim")
	use({ "williamboman/mason.nvim", run = ":MasonUpdate" }) -- :MasonUpdate updates registry contents
	use("williamboman/mason-lspconfig.nvim")
	use("nvim-telescope/telescope.nvim")
	use("sharkdp/fd")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("kyazdani42/nvim-web-devicons")
	use("morhetz/gruvbox")
	use("tanvirtin/monokai.nvim")
	use({ "sonph/onehalf", rtp = "vim" })
	use("kyazdani42/nvim-tree.lua")
	use("nvim-lualine/lualine.nvim")
	use("windwp/nvim-autopairs")
	use("numtostr/comment.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("ethanholz/nvim-lastplace")
	use("godlygeek/tabular")
	use("preservim/vim-markdown")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("maxbrunsfeld/vim-yankstack")
	use("Pocco81/true-zen.nvim")
	use("lambdalisue/suda.vim")
	use("neovim/nvim-lspconfig")
	-- use({
	-- 	"hrsh7th/nvim-cmp",
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
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	-- use 'hrsh7th/cmp-cmdline'
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })
	use("windwp/nvim-ts-autotag")
	use("lervag/vimtex")
	use("folke/which-key.nvim")
	use("tjdevries/gruvbuddy.nvim")
	use("tjdevries/colorbuddy.vim")
	use({ "SirVer/ultisnips", ft = { "latex", "tex" } })
	use({ "quangnguyen30192/cmp-nvim-ultisnips" })
	use("rafamadriz/neon")
	use("Mofiqul/vscode.nvim")
	use("marko-cerovac/material.nvim")
	use("folke/tokyonight.nvim")
	use("sainnhe/sonokai")
	use("akinsho/bufferline.nvim")
	use("gennaro-tedesco/nvim-peekup")
	use("lewis6991/spellsitter.nvim")
	use("goolord/alpha-nvim")
	use("karb94/neoscroll.nvim")
	use("akinsho/toggleterm.nvim")
	use("mfussenegger/nvim-dap")
	use("Pocco81/DAPInstall.nvim")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-dap-python")
	use("nvim-telescope/telescope-dap.nvim")
	use({ "folke/neodev.nvim", opt = true })
	use("CRAG666/code_runner.nvim")
	use({ "stevearc/dressing.nvim" })
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use({ "stevearc/overseer.nvim" })
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")
	use("tpope/vim-fugitive")
	use("nvimdev/lspsaga.nvim")
	-- use 'emakman/nvim-latex-previewer'
	-- use 'vimjas/vim-python-pep8-indent'
	-- use 'vim-scripts/peaksea'
	-- use 'psliwka/vim-smoothie'
	-- use 'jlanzarotta/bufexplorer'
end)
