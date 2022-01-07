-- Source a file that also works in normal vim
vim.cmd('source' .. ' ~/.vimrc')

-- Needed for copy paste on wsl terminals
if vim.fn.has('unix') == 1 then
    vim.cmd('map! <S-Insert> <C-R>+')
end


plugins = require("plugins")

require("plugin-loader").load(plugins)
vim.cmd("source" .. "./coc.vim")

-- require('auto_complete')
-- require('lsp')

--autosave
vim.g.auto_save = 1

-- Colorscheme, need to set before making colorscheme for lsp.
if (vim.fn.has("termguicolors")) then
    vim.o.termguicolors = true
end

vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')


vim.api.nvim_set_keymap('v', '<C-k>', '<Plug>NERDCommenterToggle<CR>gv', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<Plug>NERDCommenterToggle', { silent = true })

-- Neoterm

vim.api.nvim_set_keymap("v", '<C-l>', ':TREPLSendSelection<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-Enter', ':TREPLSendLine<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':TREPLSendLine<CR>', {noremap = true})

-- Vim rooter
vim.g.rooter_patterns = {'.git'}
vim.g.rooter_change_directory_for_non_project_files = 'current'
