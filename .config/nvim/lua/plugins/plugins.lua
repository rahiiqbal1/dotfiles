return {
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000
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
        commit = "640260d7c2d98779cab89b1e7088ab14ea354a02",
    },
    

    "mbbill/undotree",
    
    "tpope/vim-fugitive",
    
    -- LSP stuff.
    "neovim/nvim-lspconfig",
    "stevearc/dressing.nvim", -- not just for LSP but partially
    "hrsh7th/nvim-cmp", -- completion plugin
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-nvim-lsp",
    -- "hrsh7th/cmp-nvim-lua",
    
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

    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = {"nvim-tree/nvim-web-devicons"},
    }
}
