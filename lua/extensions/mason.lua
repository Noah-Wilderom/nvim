--[[
  File: mason.lua
  Description: Mason plugin configuration (with lspconfig)
  See: https://github.com/williamboman/mason.nvim
]] 


local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()
mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls", -- LSP for Lua language
        "tsserver", -- LSP for Typescript and Javascript
        "emmet_ls", -- LSP for Emmet (Vue, HTML, CSS)
        "cssls", -- LSP for CSS
        "pyright", -- LSP for Python
        "volar", -- LSP for Vue
        "gopls", -- LSP for Go
        "intelephense"
    },
});

local on_attach = function(client, bufnr)
    require("lsp-format").on_attach(client, bufnr)
end

-- Setup every needed language server in lspconfig
mason_lspconfig.setup_handlers {function(server_name)
    lspconfig[server_name].setup{}
    require("lspconfig")[server_name].setup { on_attach = on_attach }
end}
