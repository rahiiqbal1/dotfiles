return {
    {
        "sainnhe/gruvbox-material",
	lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme gruvbox-material")
        end,
    },
    
    "nvim-lua/plenary.nvim",
    
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
    },
    
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    
    "nvim-treesitter/playground",
    
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {"nvim-lua/plenary.nvim"},
    },
    
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
    },
    
    "mbbill/undotree",
    
    "tpope/vim-fugitive",
    
    -- LSP stuff.
    "stevearc/dressing.nvim",
    "hrsh7th/nvim-cmp", -- completion plugin
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    -- snippets
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    -- {
    --     "williamboman/mason.nvim",
    --     "williamboman/mason-lspconfig.nvim",
    --     "neovim/nvim-lspconfig",
    -- },
    -- "VonHeikemen/lsp-zero.nvim",
    
    "chentoast/marks.nvim",
    
    "lervag/vimtex",
    
    "tpope/vim-surround",
    
    "Vimjas/vim-python-pep8-indent",
    
    "tpope/vim-commentary",
    
    -- {
    --     "kmontocam/nvim-conda",
    --     dependencies = {"nvim-lua/plenary.nvim"},
    -- },
    
    "lukas-reineke/indent-blankline.nvim",
}
