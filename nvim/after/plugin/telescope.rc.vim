if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      prompt_prefix=🔎,
    },
  },
}
EOF

