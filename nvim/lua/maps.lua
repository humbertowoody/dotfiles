local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Map for wrap lines at 80 characters width
function WrapLines()
  vim.cmd([[%!fmt -w 80]])
end

-- Wrap lines at 80 characters width
keymap.set('n', '<C-w><C-l>', ':lua WrapLines()<CR>', { noremap = true })
