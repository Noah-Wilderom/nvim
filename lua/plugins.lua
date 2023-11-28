require "helpers/globals"

return { -- Mason {{{
{
    "lukas-reineke/lsp-format.nvim",
    config = function()
        require("lsp-format").setup {}
    end
}, {
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
    enabled = theme == "sonokai",
    lazy = false,
    config = function()
        require "extensions.colorscheme.sonokai"
    end
}, -- }}}
{
    "ellisonleao/gruvbox.nvim",
    enabled = theme == "gruvbox",
    lazy = false,
    config = function()
        require "extensions.colorscheme.gruvbox"
    end
}, {
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
    enabled = laravelEnabled,
    dependencies = {"nvim-telescope/telescope.nvim", "tpope/vim-dotenv", "MunifTanjim/nui.nvim"},
    cmd = {"Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel"},
    keys = {{"<leader>la", ":Laravel artisan<cr>"}, {"<leader>lr", ":Laravel routes<cr>"},
            {"<leader>lm", ":Laravel related<cr>"}, {
        "<Leader>l",
        "",
        desc = "Laravel"
    }, {
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
}, {
    "simrat39/symbols-outline.nvim",
    config = function()
        require "extensions.outline"
    end
}, {
    "andweeb/presence.nvim",
    enabled = discordEnabled,
    config = function()
        require("presence").setup({
            -- General options
            auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
            neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
            main_image = "neovim", -- Main image display (either "neovim" or "file")
            client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
            log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
            debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
            enable_line_number = false, -- Displays the current line number instead of the current project
            blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
            buttons = {{
                label = "Github",
                url = "https://github.com/Noah-Wilderom/nvim"
            }}, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
            file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
            show_time = true, -- Show the timer

            -- Rich Presence text options
            editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
            file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
            git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
            plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
            reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
            workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
            line_number_text = "Line %s out of %s" -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
        })
    end
},
{
    "zbirenbaum/copilot.lua",
    enabled = copilotEnabled,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require "extensions.copilot"
    end
},
-- {
--     "github/copilot.vim",
--     enabled = copilotEnabled,
--     cmd = "Copilot",
--     event = "InsertEnter",
-- },
}
