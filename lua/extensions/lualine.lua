local colors = {
    red = '#f44747',
    grey = '#f5f5f5',
    gray = '#8e99ae',
    black = '#3B4252',
    blk = '#000000',
    white = '#ffffff',
    transparent = '#2E3440',
    green = '#b1bb80',
    yellow = '#f2b589',
    cyan = '#8ab8c2',
    blue = '#84a0c6',
    magenta = '#df89dd'
}


local Nrd = {
  normal = {
    a = { fg = colors.blk, bg = colors.cyan },
    b = { fg = colors.gray,  bg = colors.black },
    c = { fg = colors.green, bg = colors.transparent },
    z = { fg = colors.gray, bg = colors.black },
  },
  insert = { 
        a = { fg = colors.blk, bg = colors.yellow },
        z = { fg = colors.gray, bg = colors.black }
  },
  visual = { 
        a = { fg = colors.blk, bg = colors.green },
        z = { fg = colors.gray, bg = colors.black }
  },
  replace = { 
        a = { fg = colors.blk, bg = colors.green },
        z = { fg = colors.gray, bg = colors.black } 
  },
}

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        globalstatus = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {{ 'filename', file_status = false, path = 4 }, "filetype"},
        lualine_c = {},
        lualine_x = {'ctime'},
        lualine_y = {'branch'},
        lualine_z = {'progress'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
