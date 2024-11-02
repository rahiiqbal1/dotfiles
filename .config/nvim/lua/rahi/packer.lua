-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
 
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- use { "catppuccin/nvim",
  -- 	as = "catppuccin",
	-- config = function()
	-- vim.cmd("colorscheme catppuccin-mocha")
	-- end}
 use { "sainnhe/gruvbox-material",
    as = "gruvbox",
    config = function()
        vim.cmd("colorscheme gruvbox-material")
    end
}

  use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    	
  use('nvim-treesitter/playground')

  use {
	  "ThePrimeagen/harpoon",
	  branch = "harpoon2",
	  requires = { {"nvim-lua/plenary.nvim"} }
  }
	
  -- Lualine:
  use {
  "nvim-lualine/lualine.nvim",
  requires = { "nvim-tree/nvim-web-devicons"}
}

  use("mbbill/undotree")
  use('tpope/vim-fugitive')
  -- lsp stuff:
  use('stevearc/dressing.nvim')

  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  use {'williamboman/mason.nvim',
       'williamboman/mason-lspconfig.nvim',
       'neovim/nvim-lspconfig',}
  use('VonHeikemen/lsp-zero.nvim')
  
  -- Mark plugin:
  use('chentoast/marks.nvim')

  use("lervag/vimtex")

  use("tpope/vim-surround")

  -- install without yarn or npm
--use({
--    "iamcco/markdown-preview.nvim",
--    run = function() vim.fn["mkdp#util#install"]() end,
--})

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" }, })

use("Vimjas/vim-python-pep8-indent")

use("tpope/vim-commentary")

use ({
    "kmontocam/nvim-conda",
    requires = { "nvim-lua/plenary.nvim" },
})

use "lukas-reineke/indent-blankline.nvim"

use "scalameta/nvim-metals"

end)

