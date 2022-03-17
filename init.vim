
" General Settings
syntax on
filetype on
filetype plugin on
filetype indent on
set tabstop=4       " show existing tab with 4 spaces width
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set expandtab       " On pressing tab, insert 4 spaces
set cursorline      " lightly highlight current line
" set relativenumber  " Turns on relative line numbers

set ignorecase
set smartcase
set hlsearch        " Highlight found matches
set incsearch       " Search on the fly, as characters are entered
" Regex Magic
" set magic
set splitbelow      " Open splitted Windows at the bottom
set splitright      " Open splitted Windows to the right

" Clear Highlighted Text when pressing escape
nnoremap <silent> <esc> :noh<cr><esc>

" Avoid common typos
map q: <Nop>
nnoremap Q <nop>

autocmd BufNewFile,BufRead *.ts set filetype=typescript
" Indent with two spaces
autocmd FileType yaml set shiftwidth=2
autocmd FileType json set shiftwidth=2
autocmd FileType typescript set shiftwidth=2

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

source ~/.config/nvim/minimal.vim
source ~/.config/nvim/ts.lua
