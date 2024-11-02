function colourMyPencils(colour)
-- 	colour = colour or "catppucin"
-- 	vim.cmd.colorscheme(colour)

--     require("catppuccin").setup({
--         integrations = {
--             cmp = true,
--             nvimtree = true,
--             treesitter = true,
--             harpoon = true,
--             mason = true,
--             nvim_surround = true,
--         }
--     })

    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

    vim.cmd([[
        hi Cursor guifg=#A89984 guibg=#A89984 
        hi Cursor2 guifg=#a9b665 guibg=#a9b665
        hi Cursor3 guifg=#ea6962 guibg=#ea6962
        set guicursor=n-v-c:block-Cursor/block-Cursor,i-ci-ve:block-Cursor2/block-Cursor2,r-cr:hor20,o:hor50,v-ve:block-Cursor3/block-Cursor3
        ]])
end

colourMyPencils()
