

lua << EOF

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}

EOF

nnoremap  <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap  <silent> // <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <silent> ;b <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
