--[[
  File: treesitter.lua
  Description: Configuration of tree-sitter
  See: https://github.com/tree-sitter/tree-sitter
]] 
require'nvim-treesitter.configs'.setup {

    -- Needed parsers
    ensure_installed = {"lua", "typescript", "javascript", "go", "python", "php", "rust"},

    -- Install all parsers synchronously
    sync_install = false,

    highlight = {
        -- Enabling highlight for all files
        enable = true,
        disable = {}
    },

    indent = {
        -- Disabling indentation for all files
        enable = true,
        disable = {}
    }
}
