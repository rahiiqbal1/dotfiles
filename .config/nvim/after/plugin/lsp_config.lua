-- Add cmp_nvim_lsp capabilities settings to lspconfig. Should be executed before any LS 
-- configuration.
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lspconfig_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

-- Stuff in here only works if there is a LS attached to the buffer.
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP keybindings",
    callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>fe", function() vim.diagnostic.setloclist() end, opts)
        vim.keymap.set("n", "<leader>pca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end,
})

-- Add available language servers here.
require("lspconfig").lua_ls.setup({})
require("lspconfig").nil_ls.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").zls.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").ltex.setup({})

-- Setting up autocompletion.
local cmp = require("cmp")
cmp.setup({
    sources = { {name = "nvim_lsp"}, },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
    }),
})

-- Some stuff to make boxes look nicer.
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)
