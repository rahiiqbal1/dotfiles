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
    {"stevearc/dressing.nvim", lazy = false},
    {"hrsh7th/nvim-cmp", lazy = false}, -- completion plugin
    {"hrsh7th/cmp-buffer", lazy = false}, -- source for text in buffer
    {"hrsh7th/cmp-path", lazy = false}, -- source for file system paths
    {"hrsh7th/cmp-nvim-lsp", lazy = false},
    {"hrsh7th/cmp-nvim-lua", lazy = false},
    -- snippets
    {"L3MON4D3/LuaSnip", lazy = false}, -- snippet engine
    {"saadparwaiz1/cmp_luasnip", lazy = false}, -- for autocompletion
    {"rafamadriz/friendly-snippets", lazy = false}, -- useful snippets
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        lazy = false
    },
    {"VonHeikemen/lsp-zero.nvim", lazy = false},
    
    "chentoast/marks.nvim",
    
    "lervag/vimtex",
    
    "tpope/vim-surround",
    
    "Vimjas/vim-python-pep8-indent",
    
    "tpope/vim-commentary",
    
    {
        "kmontocam/nvim-conda",
        dependencies = {"nvim-lua/plenary.nvim"},
    },
    
    "lukas-reineke/indent-blankline.nvim",
}
