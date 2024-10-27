function colourMyPencils(colour)
	colour = colour or "catppuccin"
	vim.cmd.colorscheme(colour)

    require("catppuccin").setup({
        integrations = {
            cmp = true,
            nvimtree = true,
            treesitter = true,
            harpoon = true,
            mason = true,
            nvim_surround = true,
        }
    })

    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

    vim.cmd([[
        hi Cursor guifg=#89b4fa guibg=#89b4fa 
        hi Cursor2 guifg=#a6e3a1 guibg=#a6e3a1
        hi Cursor3 guifg=#cba6f7 guibg=#cba6f7
        set guicursor=n-v-c:block-Cursor/block-Cursor,i-ci-ve:block-Cursor2/block-Cursor2,r-cr:hor20,o:hor50,v-ve:block-Cursor3/block-Cursor3
        ]])
end

colourMyPencils()
