-- Needed for copy paste on wsl terminals

if vim.fn.has('unix') == 1 then
    vim.cmd('map! <S-Insert> <C-R>+')
end

-- for windows
local on_windows = vim.loop.os_uname().version:match 'Windows'

local function join_paths(...)
  local path_sep = on_windows and '\\' or '/'
  local result = table.concat({ ... }, path_sep)
  return result
end

-- Source old vimrc file that also works in normal vim
vim.cmd("source" .. vim.fn.stdpath("config") .. "/lua/configs/vimrc.vim")
vim.cmd("source " .. vim.fn.stdpath("config") .. "/lua/configs/vimrc.vim")

-- TODO automate install of plug based on os platform
-- https://github.com/junegunn/vim-plug

local plugins = require("plugins")

require("plugin-loader").load(plugins)

-- Colorscheme, need to set before making colorscheme for lsp.
if (vim.fn.has("termguicolors")) then
    vim.o.termguicolors = true
end

vim.cmd("colorscheme gruvbox")


-- vim.o.background = 'dark'
-- vim.g.gruvbox_transparent_bg = 1
vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")

-- require('auto_complete')
-- require('lsp')

vim.api.nvim_set_keymap("n", "<c-m>", ":lua require'telescope.builtin'.find_files{}<CR>", { noremap = false, nowait = true })
vim.api.nvim_set_keymap("n", "<c-n>", ":lua require'telescope.builtin'.live_grep{}<CR>", { noremap = false, nowait = true })
vim.api.nvim_set_keymap("v", '<C-l>', ':TREPLSendSelection<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-Enter', ':TREPLSendLine<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':TREPLSendLine<CR>', { noremap = true })
