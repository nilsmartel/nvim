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
    " Kick the hjkl habit
    Plug 'takac/vim-hardtime'

    " Git
    Plug 'tpope/vim-fugitive'

    " Formatting related
    Plug 'chiel92/vim-autoformat'
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'
    Plug 'rstacruz/vim-closer'
    Plug 'tpope/vim-surround'

    " Finding and Opening Files
    Plug 'cloudhead/neovim-fuzzy'

    " Navigating
    Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }

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
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'tikhomirov/vim-glsl'
    Plug 'CraneStation/cranelift.vim'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'petRUShka/vim-opencl'
    Plug 'ollykel/v-vim'
    Plug 'davidhalter/jedi-vim'
call plug#end()

" Activate hardtime
let g:hardtime_default_on = 1

" Mappings for convinience
nmap ø :CocAction<CR>
nmap <space>r :OverCommandLine<CR>%s/
nmap <space>w :OverCommandLine<CR>s/
nmap <space>e :CocCommand explorer<CR>
nmap <space>f :FuzzyOpen<cr>
nmap <space>g :FuzzyGrep<cr>

nmap <space>k :sp<cr>
nmap <space>l :vsp<cr>

" Aerospace
nmap <space>as <Plug>(AerojumpSpace)
nmap <space>ab <Plug>(AerojumpBolt)
nmap <space>aa <Plug>(AerojumpFromCursorBolt)
nmap <space>ad <Plug>(AerojumpDefault) " Boring mode

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
tmap <space>cc :Codi c<CR>

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

source ~/.config/nvim/configs/ale.vim
let g:airline#extensions#coc#enabled = 1

" Automatically clear space at the end of lines
autocmd BufWritePre * %s/\s\+$//e

" Doesnt work well with darcula
"   if has('nvim') || has('termguicolors')
"       set termguicolors
"   endif

" Color Scheme
colorscheme darcula
