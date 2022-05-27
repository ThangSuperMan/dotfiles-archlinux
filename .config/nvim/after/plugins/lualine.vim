" Highlight
autocmd VimEnter * highlight lualine_x_diagnostics_error_normal guifg=#fd5d5d  
autocmd VimEnter * highlight lualine_x_diagnostics_error_insert guifg=#fd5d5d  
autocmd VimEnter * highlight lualine_x_diagnostics_error_visual guifg=#fd5d5d  
autocmd VimEnter * highlight lualine_x_diagnostics_error_replace guifg=#fd5d5d  
autocmd VimEnter * highlight lualine_x_diagnostics_error_command guifg=#fd5d5d  
autocmd VimEnter * highlight lualine_x_diagnostics_error_terminal guifg=#fd5d5d  
autocmd VimEnter * highlight lualine_x_diagnostics_error_inactive guifg=#fd5d5d  

lua << EOF

local status, lualine = pcall(require, "lualine")
if (not status) then return end

  local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local location = {
  "location",
  padding = 0,
}

local mode = {
  "mode",
  fmt = function(str)
      -- return "-- " .. str .. " --"
      return str 
  end,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

lualine.setup {
  options = {
    icons_enabled = true,
		theme= 'solarized_dark',
		-- theme= 'catppuccin',
      section_separators = {left = '', right = ''},
     -- component_separators = {left = '', right = ''},
      -- section_separators = {left = '', right = ''},
      -- component_separators = {left = ')', right = '('},
     --  section_separators = {left = '', right = ''},

    disabled_filetypes = {}
},
  sections = {
    lualine_a = {mode,
    },
    lualine_b = {branch},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
      hide_in_width,
    }},

    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic", "coc"}, 
       symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
       -- symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype',
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
tabline = {
  },
  extensions = {}
}

EOF
