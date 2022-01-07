
local M = {}

M.setup = function()
    vim.cmd('filetype plugin on')
    vim.g.NERDTrimTrailingWhitespace = 1
    vim.g.NERDSpaceDelims = 1
    vim.api.nvim_set_keymap('v', '<C-k>', '<Plug>NERDCommenterToggle<CR>gv', { silent = true })
    vim.api.nvim_set_keymap('n', '<C-k>', '<Plug>NERDCommenterToggle', { silent = true })
end

return M
