require('base')
require('highlights')
require('maps')
require('plugins')

-- Function to have a boolean value if vim _has_ the value
local has = function(x)
  return vim.fn.has(x) == 1
end

-- Variables to detect if macOS or Windows
local is_mac = has "macunix"
local is_win = has "win32"

-- Require proper library depending on the OS.
if is_mac then
  require('macos')
end
if is_win then
  require('windows')
end
