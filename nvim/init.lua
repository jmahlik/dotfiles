-- Source a file that also works in normal vim
vim.cmd('source' .. ' ~/.vimrc')

-- Needed for copy paste on wsl terminals
if vim.fn.has('unix') == 1 then
    vim.cmd('map! <S-Insert> <C-R>+')
end

-- Plugins that do not have specific configuration files
vim.fn['plug#begin'](vim.fn.stdpath('data') .. '/plugged')
    vim.fn['plug#']('morhetz/gruvbox') -- MIT license
    vim.fn['plug#']('neovim/nvim-lspconfig')
    vim.fn['plug#']('joshdick/onedark.vim') -- MIT license
    -- vim.fn['plug#']('dracula/vim', name = 'dracula') -- MIT License
    vim.fn['plug#']('morhetz/gruvbox') -- MIT license
    vim.fn['plug#']('kassio/neoterm') -- Apache 2.0 license
    -- https://github.com/junegunn/fzf/blob/master/README-VIM.md
    -- Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " MIT License
    vim.fn['plug#']('preservim/nerdcommenter') -- CC0-1.0 License
    -- Plug 'neoclide/coc.nvim', {'branch': 'release'} " MIT License
    vim.fn['plug#']('airblade/vim-rooter') -- MIT License
    vim.fn['plug#']('907th/vim-auto-save') -- MIT License
    vim.fn['plug#']('tpope/vim-fugitive') -- Vim License
    -- auto-completion
    vim.fn['plug#']('hrsh7th/nvim-cmp') --MIT
    vim.fn['plug#']('hrsh7th/vim-vsnip') --MIT
    vim.fn['plug#']('hrsh7th/cmp-buffer') --MIT
    vim.fn['plug#']('hrsh7th/cmp-nvim-lsp') -- MIT
    -- LSP
    vim.fn['plug#']('neovim/nvim-lspconfig') -- Apache 2.0
    vim.fn['plug#']('kabouzeid/nvim-lspinstall') --MIT
vim.fn['plug#end']()

--autosave
vim.g.auto_save = 1

-- Colorscheme, need to set before making colorscheme for lsp.
if (vim.fn.has("termguicolors")) then
    vim.o.termguicolors = true
end

vim.o.background = 'dark'
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')

-- Have to require this after colors are set up
require('auto_complete')
require('lsp')

vim.api.nvim_set_keymap('v', '<C-k>', '<Plug>NERDCommenterToggle<CR>gv', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<Plug>NERDCommenterToggle', { silent = true })

-- Neoterm
vim.g.python3_host_prog='~/Python/Python38/python'
vim.g.python_host_prog='~/Python/Python38/python'
vim.g.neoterm_default_mod = "belowright"
vim.g.neoterm_size=20
vim.g.neoterm_autoscroll=1
vim.g.neoterm_repl_python = {'. .venv/bin/activate && python'}
vim.g.neoterm_shell='bash --login'

vim.api.nvim_set_keymap("v", '<C-l>', ':TREPLSendSelection<CR>', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-Enter', ':TREPLSendLine<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':TREPLSendLine<CR>', {noremap = true})

-- Vim rooter
vim.g.rooter_patterns = {'.git'}
vim.g.rooter_change_directory_for_non_project_files = 'current'

-- NERDCommenter
vim.cmd('filetype plugin on')
vim.g.NERDTrimTrailingWhitespace = 1
vim.g.NERDSpaceDelims = 1
vim.api.nvim_set_keymap('v', '<C-k>', '<Plug>NERDCommenterToggle<CR>gv', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<Plug>NERDCommenterToggle', { silent = true })
