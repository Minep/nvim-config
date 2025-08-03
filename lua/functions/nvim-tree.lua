local M = {} 
local tree_api = require("nvim-tree.api") 

-- *********************************************
-- * Format the root folder name to uppercase *
-- *********************************************
M.format_root_folder = function(path)
  -- Get the last component of the path (the folder name)
  local folder_name = vim.fn.fnamemodify(path, ":t") 
  
  -- Convert the folder name to uppercase and return it
  return "[" .. string.upper(folder_name) .. "]"
end

return M  
