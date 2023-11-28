--[[
  File: cmp.lua
  Description: CMP plugin configuration (with lspconfig)
  See: https://github.com/hrsh7th/nvim-cmp
]] 
local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

local function has_words_before()
    local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

cmp.setup {
    snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body) -- Luasnip expand
        end
    },

    -- Mappings for cmp
    mapping = {
        ["<Up>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Select
        },
        ["<Down>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Select
        },
        ["<C-p>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Insert
        },
        ["<C-n>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Insert
        },
        ["<C-k>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Insert
        },
        ["<C-j>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Insert
        },
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        },
        ["<CR>"] = cmp.mapping.confirm {
            select = false
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    },

    sources = cmp.config.sources({{
        name = 'nvim_lsp'
    }, -- LSP
    {
        name = 'nvim_lsp_signature_help'
    }, -- LSP for parameters in functions
    {
        name = 'nvim_lua'
    }, -- Lua Neovim API
    {
        name = 'luasnip'
    }, -- Luasnip
    {
        name = 'buffer'
    }, -- Buffers
    {
        name = 'path'
    }, -- Paths
    {
        name = "emoji"
    } -- Emoji
    }, {}),
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol', -- Show only symbol annotations
            maxwidth = 50 -- Prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        })
    }
}

-- Add snippets from Friendly Snippets
require("luasnip/loaders/from_vscode").lazy_load()

