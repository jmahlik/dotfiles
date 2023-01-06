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
        repo = 'nvim-lua/plenary.nvim',
        license = ""
    },
    {
        repo = "nvim-telescope/telescope.nvim",
        opts = { tag = "0.1.0" },
        config = function()
            require("configs.nvim_telescope").setup()
        end,
        license = "MIT"

    },
    {
        repo = "tpope/vim-fugitive",
        license = "vim"
    },
    {
        repo = "hrsh7th/cmp-vsnip",
        license = "mit"

    },
    {
        repo = "hrsh7th/vim-vsnip",
        license = "mit"

    },
    {
        repo = "hrsh7th/cmp-nvim-lsp",
        license = "mit"

    },
    {
        repo = "hrsh7th/cmp-buffer",
        license = "mit"

    },
    {
        repo = "hrsh7th/cmp-path",
        license = "mit"

    },
    -- {
    -- repo = "hrsh7th/cmp-cmdline",
    -- license = "mit"

    -- },
    {
        repo = "hrsh7th/nvim-cmp",
        config = function()
            require("configs.nvim_cmp").setup()
        end,
        license = "mit"

    },
    {
        repo = "williamboman/nvim-lsp-installer",
        config = function()
            require("configs.nvim_lsp_installer").setup()
        end,
        license = "apache 2.0"

    },
    {
        repo = "neovim/nvim-lspconfig",
        config = function()
            require("configs.nvim_lspconfig").setup()
        end,
        license = "Apache 2.0"

    },
    {
        repo = "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("configs.null_ls").setup()
        end,
        license = "none/free"
    }
}
