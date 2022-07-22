local M = {}

M.setup = function()
    vim.g.rooter_patterns = {
        '.terraform.lock.hcl',
        '.git',
        'setup.cfg',
        'pyproject.toml',
        'package.json',
    }
    vim.g.rooter_change_directory_for_non_project_files = 'current'
end

return M
