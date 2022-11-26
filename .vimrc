"" General Configuration 
"""""""""""""""""""""""""""""
set relativenumber

syntax on

color industry

" Set tab size and charachter
set tabstop=2
set shiftwidth=2
set expandtab

" Not emulate vi
set nocompatible

" builtin vim file browsing plugin
filetype plugin on

" Source the .vimrc in the current directory
set exrc

" Show line number
set nu

" Disable error bell
set noerrorbells

" Disable wraping
set nowrap

" Incremental Search
set incsearch

" Esc button delay configuration
" Link: https://vi.stackexchange.com/questions/16148/slow-vim-escape-from-insert-mode
set timeoutlen=1000
set ttimeoutlen=5

" Enable folding
set foldmethod=indent
set shiftwidth=4
nnoremap <space> za
vnoremap <space> zf
map z1  :set foldlevel=0<CR><Esc>
map z2  :set foldlevel=1<CR><Esc>
map z3  :set foldlevel=2<CR><Esc>
map z4  :set foldlevel=3<CR><Esc>
map z5  :set foldlevel=4<CR><Esc>
map z6  :set foldlevel=5<CR><Esc>
map z7  :set foldlevel=6<CR><Esc>
map z8  :set foldlevel=7<CR><Esc>
map z9  :set foldlevel=8<CR><Esc>
map z0  :set foldlevel=99<CR><Esc>

" Remove newbie crutches in Command Mode
" cnoremap <Down> <Nop>
" cnoremap <Left> <Nop>
" cnoremap <Right> <Nop>
" cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>
" inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
" nnoremap <Down> <Nop>
" nnoremap <Left> <Nop>
" nnoremap <Right> <Nop>
" nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
" vnoremap <Down> <Nop>
" vnoremap <Left> <Nop>
" vnoremap <Right> <Nop>
" vnoremap <Up> <Nop>


" Fuzzy file search in vim with out plugin
" Link: https://www.youtube.com/watch?v=XA2WjJbmmoM&t=3482s
" Search down into subfolders
set path+=**
" Display all matching files when pressing tab
set wildmenu
"""""""""""""""""""""""""""""

"" Tag jumping
"""""""""""""""""""""""""""""
command! MakeTags !ctags -R .
"""""""""""""""""""""""""""""

"" File browsing
"""""""""""""""""""""""""""""
let g:netrw_banner=0        " disable the annoying banner
let g:netrw_browse_split=0  " open in the same window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
" Note: Below options cause slow startup -> Disabled
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'
"""""""""""""""""""""""""""""

"" Linters
"""""""""""""""""""""""""""""
" Setting linter for C and C++
" By default clangd is used for C/C++
let g:ale_linters={
\ 'c': ['gcc'],
\ 'cpp': ['gcc'],
\}
"""""""""""""""""""""""""""""


"" Plugin Configuration
"""""""""""""""""""""""""""""
" To install plugged
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" cmake4vim
Plug 'ilyachur/cmake4vim'

" nerdtree
Plug 'preservim/nerdtree'

" vim-surround
Plug 'tpope/vim-surround'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" dense-analysis/ale
Plug 'dense-analysis/ale'

" nvie/vim-flake8"
Plug 'nvie/vim-flake8'

" Initialize plugin system
call plug#end()
"""""""""""""""""""""""""""""

"" Costum commands
"""""""""""""""""""""""""""""

" To write on files that has been opened without root access
command W :execute ':silent w !sudo tee % > /dev/null' | :if v:shell_error | :edit! | :endif

"" System dependent configs
source ~/.vim_extra.vim
