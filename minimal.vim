" in case vim is started from fish
if &shell =~# 'fish$'
    set shell=sh
endif
" Coc installed files are:
"
" https://github.com/weirongxu/coc-explorer
"
" :CocInstall coc-explorer
"
" https://github.com/fannheyward/coc-rust-analyzer
"
" :CocInstall coc-rust-analyzer
"
" :CocInstall coc-actions
"
" Binaries required
"
"   # Rust Analyzer
"
"   git clone https://github.com/rust-analyzer/rust-analyzer
"   cd rust-analyzer
"   rustup component add rust-src
"   cargo xtask install --server
"
"   # fzy
"   brew install fzy
" CocInstall coc-go
" CocInstall coc-docker

" Ensure that mouse clicking works nice
set mouse=a

" Set the <esc> key to something more accessible
inoremap jj <esc>

call plug#begin()
    " Git
    Plug 'tpope/vim-fugitive'

    " Treesitter
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

    " Formatting related
    Plug 'chiel92/vim-autoformat'
    Plug 'rstacruz/vim-closer'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    " Finding and Opening Files
    Plug 'cloudhead/neovim-fuzzy'

    Plug 'markonm/traces.vim'

    " Documenting
    Plug 'scrooloose/nerdcommenter'

    " Usefull to see in realtime which parts a regex will hit
    Plug 'osyo-manga/vim-over'

    " Live editing
    Plug 'jpalardy/vim-slime'
    Plug 'metakirby5/codi.vim'


    " Syntax and Themes
    Plug 'bluz71/vim-nightfly-guicolors'
    Plug 'rafalbromirski/vim-aurora'
    Plug 'bluz71/vim-nightfly-guicolors'
    Plug 'liuchengxu/space-vim-theme'
    Plug 'morhetz/gruvbox'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'arzg/vim-colors-xcode', { 'as': 'xcode' }
    Plug 'doums/darcula'
    Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

    " Status Bar
    Plug 'vim-airline/vim-airline'

    " Languager Server & linter
    Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'w0rp/ale'

    " Language specific
    Plug 'jeaye/color_coded' " c
    Plug 'vim-crystal/vim-crystal'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'ziglang/zig.vim'
    Plug 'HerringtonDarkholme/yats.vim' " typescript / react
    Plug 'rust-lang/rust.vim'   " rust
    Plug 'fatih/vim-go' " , { 'do': ':GoUpdateBinaries' }
    Plug 'tikhomirov/vim-glsl'
    Plug 'CraneStation/cranelift.vim' " cranelift ir
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'petRUShka/vim-opencl'
    Plug 'ollykel/v-vim', { 'for': 'vlang' }
    Plug 'davidhalter/jedi-vim'
    Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
    Plug 'alx741/vim-hindent', { 'for': 'haskell' }
    Plug 'pangloss/vim-javascript'
    Plug 'dag/vim-fish'
call plug#end()

" Mappings for convinience
nmap ø :CocAction<CR>
nmap <space>r :OverCommandLine<CR>%s/
nmap <space>w :OverCommandLine<CR>s/
nmap <space>e :CocCommand explorer<CR>
nmap <space>f :FuzzyOpen<cr>

nmap <space>g :FuzzyGrep<cr>

" Open window to a given side
" and open finder window
nmap <space>k :sp<cr><c-w>k:FuzzyOpen<cr>
nmap <space>j :sp<cr>:FuzzyOpen<cr>
nmap <space>l :vsp<cr>:FuzzyOpen<cr>
nmap <space>h :vsp<cr><c-w>h:FuzzyOpen<cr>

" new line underneath
nmap <c-o>  o<c-c>k


" Moving Window sizes
nmap <c-l> <c-w><
nmap <c-h> <c-w>>
nmap <c-j> <c-w>-
nmap <c-k> <c-w>+

" Codi repls
nmap <space>cp :Codi python<CR>
nmap <space>cj :Codi julia<CR>
nmap <space>ch :Codi haskell<CR>
nmap <space>cn :Codi javascript<CR>
nmap <space>ct :Codi typescript<CR>
nmap <space>cc :Codi c<CR>

nmap <space><space> :'<,'>Commentary<CR>

" Highlight the current line
set cul

" Plugin Specific
    " Get Slime to work
let g:slime_target = "tmux"

    " Proper use of Selection
autocmd InsertLeave, CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


source ~/.config/nvim/configs/ale.vim
let g:airline#extensions#coc#enabled = 1
let g:airline_theme = 'dracula'

" Automatically clear space at the end of lines
autocmd BufWritePre * %s/\s\+$//e

" Doesnt work well with darcula
"   if has('nvim') || has('termguicolors')
"       set termguicolors
"   endif

" Color Scheme

set termguicolors
au FileType c,cpp,glsl,opencl,opengl,metal set notermguicolors


" Language Agnostic sources
au FileType go source ~/.config/nvim/configs/go.vim
au FileType rust source ~/.config/nvim/configs/rust.vim
au FileType julia source ~/.config/nvim/configs/julia.vim
au FileType latex,tex source ~/.config/nvim/configs/latex.vim
au FileType html,javascript,typescript,typescriptreact,json,yaml source ~/.config/nvim/configs/webdev.vim

" Colorscheme selection
colorscheme xcodedark
set termguicolors

" Recognize solar files
au BufNewFile,BufRead *.sol set filetype=solar
au FileType solar set syntax=haskell

" Recognize crystal
au BufNewFile,BufRead *.cr set filetype=crystal
" au FileType solar set syntax=ruby


let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/local/bin/python3"

" TODO check this in practice
" I got a number of formatters installed by now.
" Not happy with the `google/*` stuff.
" Checking if coc does a better job
nnoremap <c-f> :call CocAction('format')<CR>


" latex live preview opened with :LLPStartPreview
let g:livepreview_previewer = 'open -a Preview'
nmap <space>x :LLPStartPreview<CR>


" using this only for neovide
let g:neovide_iso_layout=1
