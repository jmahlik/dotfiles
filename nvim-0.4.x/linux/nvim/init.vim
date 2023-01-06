source ~/.vimrc

" for nvim-qt.exe
map! <S-Insert> <C-R>+

call plug#begin('~/.vim/plugged')

" Plug 'drewtempelmeyer/palenight.vim' " CC0-1.0 License
Plug 'joshdick/onedark.vim' " MIT license
" Plug 'dracula/vim', { 'name': 'dracula' } " MIT License
" Plug 'sillybun/vim-repl' " gpl 2.0 license
" Plug 'hkupty/iron.nvim' " bsd 3 clause license
Plug 'kassio/neoterm' " Apache 2.0 license
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " MIT License
Plug 'preservim/nerdcommenter' " CC0-1.0 License
Plug 'neoclide/coc.nvim', {'branch': 'release'} " MIT License
Plug 'airblade/vim-rooter' "MIT License
Plug '907th/vim-auto-save' "MIT License
Plug 'tpope/vim-fugitive' " Vim License
"Plug 'szw/vim-maximizer' " vim license
" Plug 'metakirby5/codi.vim' " MIT license
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'beeender/Comrade'
"Plug 'sirver/ultisnips'

call plug#end()

" For autosaves
let g:auto_save = 1

let g:python3_host_prog='~/Python/Python38/python'
let g:python_host_prog='~/Python/Python38/python'
" let g:neoterm_direct_open_repl=1
let g:neoterm_default_mod = "belowright"
let g:neoterm_size=20
let g:neoterm_autoscroll=1
let g:neoterm_repl_python = ['. .venv/bin/activate && ipython']
let g:neoterm_shell='bash --login'

" let g:neoterm_repl_python = '.venv\Scrips\activate.bat python'
" '.venv\Scripts\activate.bat'
" if has("win32") || has("win64")
   " let g:neoterm_eof = "\r"
" endif

" Vim rooter 
let g:rooter_patterns = ['.git']
let g:rooter_change_directory_for_non_project_files = 'current'
vnoremap <C-Enter> :TREPLSendSelection<CR>

vnoremap <C-l> :TREPLSendSelection<CR>
inoremap <C-Enter> <silent> :TREPLSendLine<CR>
nnoremap <C-Enter> :TREPLSendLine<CR>
" vnoremap <C-Enter> <Plug>(neoterm-repl-send-selection)
" inoremap <C-Enter> <Plug>(neoterm-repl-send-line)
" nnoremap <C-Enter> <Plug>(neoterm-repl-send-line)



" Coc 
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" go back to where you exited
if has("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif

" --- Coc ---
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'setup.cfg', 'setup.py', 'pyproject.toml']

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

hi CocHighlightText guibg=#556873 gui=bold

let g:coc_auto_copen = 0
autocmd User CocQuickfixChange :call fzf_quickfix#run()

let g:coc_global_extensions = ['coc-json', 'coc-pyright', 'coc-yaml', 'coc-todolist', 'coc-toml', 'coc-sh'] 
" 'coc-clangd'
" --- Coc ---
" let g:coc_force_debug = 1
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <a-cr>  <Plug>(coc-fix-current)
" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Using CocList
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <leader>em :CocCommand python.refactorExtractMethod<cr>
vnoremap <leader>em :CocCommand python.refactorExtractMethod<cr>
nnoremap <leader>ev :CocCommand python.refactorExtractVariable<cr>

" colors
colorscheme onedark
" colorscheme dracula
" colorscheme palenight

set background=dark
"let g:airline_theme='gruvbox'

if (has("termguicolors"))
    set termguicolors
endif

"lua require 'colorizer'.setup()

" COC
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" fzf stuff todo 
set rtp+=~/.fzf
" Shift+Space (@ - space)
inoremap <S-Space> <C-o>$

" NERDCommenter
filetype plugin on
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1
vmap <C-/> <Plug>NERDCommenterToggle<CR>gv
nmap <C-/> <plug>NERDCommenterToggle

" Tabs
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#fnamemode=':t'
"
" let g:slime_target = "neovim"
"
