local M = {}

M.setup = function()
    vim.g.rooter_patterns = {'.git'}
    vim.g.rooter_change_directory_for_non_project_files = 'current'
end

return M