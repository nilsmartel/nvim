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

call plug#begin()

    " Git
    Plug 'tpope/vim-fugitive'

    " Formatting related
    Plug 'chiel92/vim-autoformat'
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'
    Plug 'rstacruz/vim-closer'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    " Finding and Opening Files
    Plug 'cloudhead/neovim-fuzzy'

    " Documenting
    Plug 'scrooloose/nerdcommenter'

    " Usefull to see in realtime which parts a regex will hit
    Plug 'osyo-manga/vim-over'

    " Live editing
    Plug 'jpalardy/vim-slime'
    Plug 'metakirby5/codi.vim'
    Plug 'vim-scripts/vim-auto-save'
    Plug 'mg979/vim-visual-multi'


    " Syntax and Themes
    Plug 'rafalbromirski/vim-aurora'
    Plug 'bluz71/vim-nightfly-guicolors'
    Plug 'liuchengxu/space-vim-theme'
    Plug 'morhetz/gruvbox'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'arzg/vim-colors-xcode', { 'as': 'xcode' }
    Plug 'doums/darcula'
    Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

    " Zen Mode
    Plug 'junegunn/goyo.vim'

    " Status Bar
    Plug 'vim-airline/vim-airline'

    " Languager Server & linter
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'w0rp/ale'
    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    " Plug 'zxqfl/tabnine-vim'

    " Language agnostic
    Plug 'rust-lang/rust.vim'
    Plug 'fatih/vim-go' " , { 'do': ':GoUpdateBinaries' }
    Plug 'tikhomirov/vim-glsl'
    Plug 'CraneStation/cranelift.vim'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'petRUShka/vim-opencl'
    Plug 'ollykel/v-vim', { 'for': 'vlang' }
    Plug 'davidhalter/jedi-vim'
    Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
    Plug 'alx741/vim-hindent', { 'for': 'haskell' }
    Plug 'pangloss/vim-javascript'
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

" Language Agnostic sources
au FileType go source ~/.config/nvim/configs/go.vim
au FileType rust source ~/.config/nvim/configs/rust.vim
au FileType julia source ~/.config/nvim/configs/julia.vim
au FileType latex,tex source ~/.config/nvim/configs/latex.vim


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

au FileType rust,go,haskell colorscheme darcula
au FileType c,cpp,glsl,opencl,opengl,metal colorscheme gruvbox
au FileType html,javascript,typescript,json,yaml colorscheme aurora
au FileType vlang colorscheme aurora

au FileType vim colorscheme challenger_deep


" TODO check this in practice
" I got a number of formatters installed by now.
" Not happy with the `google/*` stuff.
" Checking if coc does a better job
nnoremap <c-f> :call CocAction('format')<CR>
