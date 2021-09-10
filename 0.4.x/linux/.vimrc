"set up shell

set nocompatible
" set clipboard=unamedplus

syntax on
syntax enable 
filetype off 

" set encoding=utf-8
" set fileformat=unix
set mouse=a
set number relativenumber
set scrolloff=8
set hlsearch 

" set hidden
set noerrorbells

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
"set smartindent

set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set cmdheight=2
"set backspace=indent,eol,start
set colorcolumn=80


let mapleader = ' '
" Shift+Space (@ - space)
" inoremap <S-Space> <C-o>$
noremap p "*p
inoremap jk <Esc>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>E :wincmd r<CR>
nnoremap <leader>e :wincmd R<CR>
nnoremap <Leader>= :vertical resize +15<CR>
nnoremap <Leader>- :vertical resize -15<CR>
nnoremap <Leader>+ :resize +10<CR>
nnoremap <Leader>_ :resize -10<CR>

tnoremap <a-h> <C-\><C-N><C-w>h
tnoremap <a-j> <C-\><C-N><C-w>j
tnoremap <a-k> <C-\><C-N><C-w>k
tnoremap <a-l> <C-\><C-N><C-w>l

" terminal mappings
nnoremap <Leader>t :new \| terminal<CR>
" Split into a new terminal instance
" tnoremap <Leader>t <C-\><C-n><C-w><C-s> :terminal <CR>
"tnoremap <C-w>v <C-\><C-n><C-w><C-v> :terminal <CR>
set splitbelow
set splitright

tnoremap jk <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" use system clipboard
noremap y "*y
noremap yy "*yy
noremap Y "*y$
noremap p "*p
noremap P "*P
noremap vA ggVG
noremap x "*x

" file explore
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 10 
set wildmenu
" Ignores
" set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
" set wildignore+=*.pdf,*.psd
" set wildignore+=node_modules/*,bower_components/*
"augroup ProjectDrawer
	"autocmd!
	"autocmd VimEnter * :Vexplore
"augroup END
noremap <Leader>q :Vexplore<CR>

" vim repl
" noremap <leader>r :REPLToggle
