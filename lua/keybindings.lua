require "helpers/globals"
require "helpers/keyboard"
local icons = require("helpers/icons")

g.mapleader = ' ' -- Use Space, like key for alternative hotkeys

local sections = {
    f = icons.Search .. " Find",
    t = icons.Terminal .. " Terminal",
    p = icons.Package .. " Packages",
    g = icons.Git .. " Git"
}

nm('<Leader>q', '<cmd>confirm q<cr>', "Quit")
nm('<Leader>n', '<cmd>enew<cr>', "New file")
-- nm('<Leader>w', '<cmd>w<cr>', "Save")
nm('<C-s>', '<cmd>w!<cr>', 'Force write')
nm('<Leader>o', '<cmd>SymbolsOutline<cr>', "Symbols Outline")

-- LSP {{{
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>') -- Hover object
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>') -- Code actions
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>') -- Rename an object
nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>') -- Go to declaration
nm('gd', '<cmd>lua vim.lsp.buf.definition()<cr>') -- Go to declaration
-- }}}

-- Telescope {{{
vim.keymap.set('n', '<Leader>f', sections.f)
vim.keymap.set('n', '<Leader>fb', function()
    require("telescope.builtin").buffers()
end, {
    desc = "Find buffers"
})
vim.keymap.set('n', '<Leader>fc', function()
    require("telescope.builtin").grep_string()
end, {
    desc = "Find word under cursor"
})
vim.keymap.set('n', '<Leader>fC', function()
    require("telescope.builtin").commands()
end, {
    desc = "Find commands"
})
vim.keymap.set('n', '<Leader>ff', function()
    require("telescope.builtin").find_files {
        hidden = true
    }
end, {
    desc = "Find files"
})
vim.keymap.set('n', '<Leader>fw', function()
    require("telescope.builtin").live_grep()
end, {
    desc = "Find words"
})
vim.keymap.set('n', '<Leader>fo', function()
    require("telescope.builtin").oldfiles()
end, {
    desc = "Find history"
})

vim.keymap.set('n', '<Leader>fh', function()
    require("telescope.builtin").help_tags()
end, {
    desc = "Find help"
})
vim.keymap.set('n', '<Leader>fma', function()
    require("telescope.builtin").man_pages()
end, {
    desc = "Find man"
})
vim.keymap.set('n', '<Leader>fm', function()
    require("telescope.builtin").colorscheme {
        enable_preview = true
    }
end, {
    desc = "Find themes"
})

vim.keymap.set('n', '<Leader>gb', function()
    require("telescope.builtin").git_branches {
        use_file_path = true
    }
end, {
    desc = "Git branches"
})
vim.keymap.set('n', '<Leader>gc', function()
    require("telescope.builtin").git_commits {
        use_file_path = true
    }
end, {
    desc = "Git commits (repository)"
})
vim.keymap.set('n', '<Leader>gC', function()
    require("telescope.builtin").git_bcommits {
        use_file_path = true
    }
end, {
    desc = "Git commits (current file)"
})
vim.keymap.set('n', '<Leader>gt', function()
    require("telescope.builtin").git_status {
        use_file_path = true
    }
end, {
    desc = "Git status"
})

-- Copilot {{{
-- }}}


-- Plugin Manager
vim.keymap.set('n', '<Leader>p', sections.p)
vim.keymap.set('n', '<Leader>pi', function()
    require("lazy").install()
end, {
    desc = "Plugins Install"
})
vim.keymap.set('n', '<Leader>ps', function()
    require("lazy").home()
end, {
    desc = "Plugins Status"
})
vim.keymap.set('n', '<Leader>pS', function()
    require("lazy").sync()
end, {
    desc = "Plugins Sync"
})
vim.keymap.set('n', '<Leader>pu', function()
    require("lazy").check()
end, {
    desc = "Plugins Check Updates"
})
vim.keymap.set('n', '<Leader>pU', function()
    require("lazy").update()
end, {
    desc = "Plugins Update"
})

nm('<Leader>pm', '<cmd>Mason<cr>', 'Mason Installer')
nm('<Leader>pM', '<cmd>MasonUpdateAll<cr>', 'Mason Update')

nm('<Leader>e', '<cmd>Neotree toggle<cr>', 'Toggle Explorer')

vim.keymap.set('n', "<Leader>/", function()
    require("Comment.api").toggle.linewise.current()
end, {
    desc = "Toggle comment line"
})
vim.keymap.set('v', "<Leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {
    desc = "Toggle comment for selection"
})

vim.keymap.set('n', '<Leader>g', sections.g)
vim.keymap.set('n', '<Leader>]g', function()
    require("gitsigns").next_hunk()
end, {
    desc = "Next Git hunk"
})
vim.keymap.set('n', '<Leader>[g', function()
    require("gitsigns").prev_hunk()
end, {
    desc = "Previous Git hunk"
})
vim.keymap.set('n', '<Leader>gl', function()
    require("gitsigns").blame_line()
end, {
    desc = "View Git blame"
})
vim.keymap.set('n', '<Leader>gL', function()
    require("gitsigns").blame_line {
        full = true
    }
end, {
    desc = "View full Git blame"
})
vim.keymap.set('n', '<Leader>gp', function()
    require("gitsigns").preview_hunk()
end, {
    desc = "Preview Git hunk"
})
vim.keymap.set('n', '<Leader>gh', function()
    require("gitsigns").reset_hunk()
end, {
    desc = "Reset Git hunk"
})
vim.keymap.set('n', '<Leader>gr', function()
    require("gitsigns").reset_buffer()
end, {
    desc = "Reset Git buffer"
})
vim.keymap.set('n', '<Leader>gs', function()
    require("gitsigns").stage_hunk()
end, {
    desc = "Stage Git hunk"
})
vim.keymap.set('n', '<Leader>gS', function()
    require("gitsigns").stage_buffer()
end, {
    desc = "Stage Git buffer"
})
vim.keymap.set('n', '<Leader>gu', function()
    require("gitsigns").undo_stage_hunk()
end, {
    desc = "Unstage Git hunk"
})
vim.keymap.set('n', '<Leader>gd', function()
    require("gitsigns").diffthis()
end, {
    desc = "View Git diff"
})

vim.keymap.set('n', '<Leader>t', sections.t)
nm('<Leader>th', "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "ToggleTerm horizontal split")
nm('<Leader>tv', "<cmd>ToggleTerm size=80 direction=vertical<cr>", "ToggleTerm vertical split")

-- Trouble {{{
nm('<leader>x', '<cmd>TroubleToggle<CR>') -- Show all problems in project (with help of LSP)
nm('gr', '<cmd>Trouble lsp_references<CR>') -- Show use of object in project
-- }}}