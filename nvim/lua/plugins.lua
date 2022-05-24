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
    -- {repo = 'neovim/nvim-lspconfig',
    -- license = "Apache 2.0",
    -- },
    {
        repo = "neoclide/coc.nvim",
        opts = {branch = 'release'},
        config = function()
            vim.cmd("source" .. vim.fn.stdpath("config") .. "/lua/configs/coc.vim")
        end,
        license = "MIT",
    },
    {

        repo = "airblade/vim-rooter",
        config = function()
            require("configs.vimrooter").setup()
        end,
        license = "MIT",
    },
    {

        repo = "907th/vim-auto-save",
        config = function()
            require("configs.vim_auto_save").setup()
        end,
        license = "MIT",
    },
    {

        repo = "nvim-treesitter/nvim-treesitter",
        config = function()
            require("configs.treesitter").setup()
        end,
        license = "Apache-2.0",
    },
    {
        repo = 'nvim-lua/plenary.nvim',
        license = ""
    },
    {
        repo = 'nvim-telescope/telescope.nvim',
        config = function()
            require("configs.nvim_telescope").setup()
        end,
        license = "MIT"

    }
    -- Doesn't work on windows
	-- vim.fn['plug#']('tpope/vim-fugitive') -- Vim License
	-- -- auto-completion
	-- vim.fn['plug#']('hrsh7th/nvim-cmp') --MIT
	-- vim.fn['plug#']('hrsh7th/vim-vsnip') --MIT
	-- vim.fn['plug#']('hrsh7th/cmp-buffer') --MIT
	-- vim.fn['plug#']('hrsh7th/cmp-nvim-lsp') -- MIT
	-- -- LSP
	-- vim.fn['plug#']('kabouzeid/nvim-lspinstall') --MIT
}
