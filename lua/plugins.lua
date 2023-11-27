require "helpers/globals"

return { -- Mason {{{
{
    "lukas-reineke/lsp-format.nvim",
    config = function()
        require("lsp-format").setup {}
    end
},
{
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {"williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig"},
    config = function()
        require "extensions.mason"
    end
}, -- }}}
-- Neo Tree {{{
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {"nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim"},
    config = function()
        require "extensions.neotree"
    end
}, -- }}}
-- Telescope {{{
{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    lazy = false,
    dependencies = {"nvim-lua/plenary.nvim", "ahmedkhalf/project.nvim"},
    config = function()
        require "extensions.telescope"
    end
}, -- }}}
-- CMP {{{
{
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path',
                    'hrsh7th/cmp-nvim-lsp-signature-help', 'hrsh7th/cmp-nvim-lua', 'rafamadriz/friendly-snippets'},
    config = function()
        require "extensions.cmp"
    end
}, -- }}}
-- LSP Kind {{{
{
    'onsails/lspkind-nvim',
    lazy = true,
    config = function()
        require "extensions.lspkind"
    end
}, -- }}}
-- Git Signs{{{
{
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
        require "extensions.gitsigns"
    end
}, -- }}}
-- Trouble {{{
{
    "folke/trouble.nvim",
    lazy = true,
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
        require "extensions.trouble"
    end
}, -- }}}
-- TreeSitter {{{
{
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    dependencies = {"JoosepAlviste/nvim-ts-context-commentstring", "nvim-treesitter/nvim-treesitter-textobjects"},
    cmd = {"TSBufDisable", "TSBufEnable", "TSBufToggle", "TSDisable", "TSEnable", "TSToggle", "TSInstall",
           "TSInstallInfo", "TSInstallSync", "TSModuleInfo", "TSUninstall", "TSUpdate", "TSUpdateSync"},
    build = ":TSUpdate",
    event = {"BufReadPost", "BufNewFile"},
    config = function()
        require "extensions.treesitter"
    end
}, -- }}}
-- Theme: Sonokai {{{
{
    "sainnhe/sonokai",
    lazy = false,
    config = function()
        require "extensions.colorscheme.sonokai"
    end
}, -- }}}
{
    'goolord/alpha-nvim',
    config = function()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
}, {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    }
}, {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
}, {
    "adalessa/laravel.nvim",
    dependencies = {"nvim-telescope/telescope.nvim", "tpope/vim-dotenv", "MunifTanjim/nui.nvim"},
    cmd = {"Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel"},
    keys = {{"<leader>la", ":Laravel artisan<cr>"}, {"<leader>lr", ":Laravel routes<cr>"},
            {"<leader>lm", ":Laravel related<cr>"},
			{"<Leader>l", "", desc = "Laravel"}, {
        "<leader>lt",
        function()
            require("laravel.tinker").send_to_tinker()
        end,
        mode = "v",
        desc = "Laravel Application Routes"
    }},
    event = {"VeryLazy"},
    config = function()
        require("laravel").setup()
        require("telescope").load_extension "laravel"
    end
}, {
    'archibate/lualine-time',
    version = "*",
    config = true
}, {
    "nvim-lualine/lualine.nvim",
    version = "*",
    config = function()
        require "extensions.lualine"
    end
}, {
    "m4xshen/autoclose.nvim",
    version = "*",
    config = true
}, {
    "numToStr/Comment.nvim",
    keys = {{
        "gc",
        mode = {"n", "v"},
        desc = "Comment toggle linewise"
    }, {
        "gb",
        mode = {"n", "v"},
        desc = "Comment toggle blockwise"
    }},
    opts = function()
        local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
        return commentstring_avail and commentstring and {
            pre_hook = commentstring.create_pre_hook()
        } or {}
    end
},
{
    "simrat39/symbols-outline.nvim",
    config = function()
        require "extensions.outline"
    end
}
}
