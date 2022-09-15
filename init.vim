
" General Settings
" that configure common settings of neovim to my liking

syntax on
filetype on
filetype plugin on
filetype indent on
set tabstop=4       " show existing tab with 4 spaces width
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set expandtab       " On pressing tab, insert 4 spaces
set cursorline      " lightly highlight current line
" set relativenumber  " Turns on relative line numbers

" Ensure that mouse clicking works nice
set mouse=a

" Tone down matching bracket color highlighting
hi MatchParen cterm=none ctermbg=none ctermfg=blue

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

nmap ø {
nmap þ }

" Avoid common typos
map q: <Nop>
nnoremap Q <nop>

" Automatically clear space at the end of lines
autocmd BufWritePre * %s/\s\+$//e


autocmd BufNewFile,BufRead *.ts set filetype=typescript
" Indent with two spaces
autocmd FileType yaml set shiftwidth=2
autocmd FileType json set shiftwidth=2
autocmd FileType typescript set shiftwidth=2

" Moving Window sizes
nmap <c-l> <c-w><
nmap <c-h> <c-w>>
nmap <c-j> <c-w>-
nmap <c-k> <c-w>+

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Ensure that { and } work on blank lines, not just empty ones
noremap { <Cmd>call search('^\s*\S', 'Wbc') \| call search('^\s*$\\|\%^', 'Wb')<CR>
noremap } <Cmd>call search('^\s*\S', 'Wc') \| call search('^\s*$\\|\%$', 'W')<CR>

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/coc.vim

source ~/.config/nvim/ts.lua
source ~/.config/nvim/solar.vim

" Toggle explorer
nmap <c-e> <esc>:NERDTreeToggle<cr>

" Recognize crystal, wgsl, etc.
au BufNewFile,BufRead *.cr set filetype=crystal

au BufNewFile,BufRead *.wgsl set filetype=wgsl

" Language Agnostic sources
au FileType go source ~/.config/nvim/configs/go.vim
au FileType julia source ~/.config/nvim/configs/julia.vim
au FileType latex,tex source ~/.config/nvim/configs/latex.vim
au FileType html,javascript,typescript,typescriptreact,json,yaml source ~/.config/nvim/configs/webdev.vim

" Colorscheme selection
set termguicolors
colorscheme onedark
let g:airline_theme='xcodedark'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
