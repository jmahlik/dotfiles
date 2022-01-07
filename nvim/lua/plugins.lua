return {
	{
		repo = "morhetz/gruvbox",
		license = "MIT license",
		config = function()
			require("configs.gruvbox").setup()
		end,
	},
	{
		repo = "hoob3rt/lualine.nvim",
		config = function()
			require("lualine").setup()
		end,
	},
	{
		repo = "kassio/neoterm",
		config = function()
			require("configs.neoterm").setup()
		end,
		license = "Apache 2.0 license",
	},
	{
		repo = "preservim/nerdcommenter",
		config = function()
			require("configs.nerdcommenter").setup()
		end,
		license = "CC0-1.0 License",
	},
    {repo = 'neovim/nvim-lspconfig',
    license = "Apache 2.0",
    },
    {repo = "neoclide/coc.nvim",
    opts = {branch = 'release'},
    config = function()
        vim.cmd("source" .. "coc.vim")
    end,
    license = "MIT"}
	-- -- Plug 'neoclide/coc.nvim', {'branch': 'release'} " MIT License
	-- vim.fn['plug#']('airblade/vim-rooter') -- MIT License
	-- vim.fn['plug#']('907th/vim-auto-save') -- MIT License
	-- vim.fn['plug#']('tpope/vim-fugitive') -- Vim License
	-- -- auto-completion
	-- vim.fn['plug#']('hrsh7th/nvim-cmp') --MIT
	-- vim.fn['plug#']('hrsh7th/vim-vsnip') --MIT
	-- vim.fn['plug#']('hrsh7th/cmp-buffer') --MIT
	-- vim.fn['plug#']('hrsh7th/cmp-nvim-lsp') -- MIT
	-- -- LSP
	-- vim.fn['plug#']('kabouzeid/nvim-lspinstall') --MIT
}
