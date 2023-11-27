local neotree = require("neo-tree")

neotree.setup({
    auto_clean_after_session_restore = true,
    close_if_last_window = true,
    name = {
        trailing_slash = true,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName"
    },
    window = {
        width = 30,
        mappings = {
          ["<space>"] = false, -- disable space until we figure out which-key disabling
          ["[b"] = "prev_source",
          ["]b"] = "next_source",
          O = "system_open",
          Y = "copy_selector",
          h = "parent_or_close",
          l = "child_or_open",
          o = "open",
        }
    },
    filesystem = {
        follow_current_file = true
    }
})
