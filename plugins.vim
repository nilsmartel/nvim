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

call plug#begin()
    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

    " Rainbow!
    Plug 'luochen1990/rainbow'

    Plug 'preservim/nerdtree'
    Plug 'unblevable/quick-scope'

    " Formatting related
    Plug 'chiel92/vim-autoformat'
        " automatically closes brackets
    " Plug 'rstacruz/vim-closer'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    " Finding and Opening Files
    Plug 'cloudhead/neovim-fuzzy'

    " hightlights selections of text when substituting
    Plug 'markonm/traces.vim'

    " Live editing
    Plug 'jpalardy/vim-slime'
    Plug 'metakirby5/codi.vim'


    " Syntax and Themes:q
    Plug 'navarasu/onedark.nvim'
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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Language specific
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'Olical/conjure', {'tag': 'v4.22.1'}
    Plug 'rhysd/vim-llvm' " llvm ir
    Plug 'bfrg/vim-cpp-modern', { 'for': 'cpp' }
    Plug 'keith/swift.vim', { 'for': 'swift' }
    Plug 'vim-crystal/vim-crystal', { 'for': 'crystal' }
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'ziglang/zig.vim', { 'for': 'zig' }
    Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescriptreact' } " typescript / react
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }   " rust
    Plug 'cespare/vim-toml', { 'for': 'toml' }
    Plug 'fatih/vim-go', { 'for': 'go' } " , { 'do': ':GoUpdateBinaries' }
    Plug 'tikhomirov/vim-glsl', { 'for': 'glsl' }
    Plug 'JuliaEditorSupport/julia-vim', { 'for': 'julia' }
    Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
    Plug 'petRUShka/vim-opencl', { 'for': 'opencl' }
    Plug 'ollykel/v-vim', { 'for': 'vlang' }
    Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
    Plug 'alx741/vim-hindent', { 'for': 'haskell' }
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
    Plug 'dag/vim-fish', { 'for': 'fish' }
call plug#end()


" nmap O k o " doesnt work for first line
nmap O I<cr><esc>ka

" Fuzzy Searching
nmap <space>f :FuzzyOpen<cr>
nmap <space>g :FuzzyGrep<cr>

" Open window to a given side
" and open finder window
nmap <space>k :sp<cr><c-w>k:FuzzyOpen<cr>
nmap <space>j :sp<cr>:FuzzyOpen<cr>
nmap <space>l :vsp<cr>:FuzzyOpen<cr>
nmap <space>h :vsp<cr><c-w>h:FuzzyOpen<cr>

nmap <space><space> :tabedit<cr>:FuzzyGrep<cr>
" make grepping work as if we're in vscode
nmap <C-p> <esc>:FuzzyGrep<CR>

" Highlight the current line
set cul

" Plugin Specific
    " Get Slime to work
let g:slime_target = "tmux"

let g:airline#extensions#coc#enabled = 1



" latex live preview opened with :LLPStartPreview
let g:livepreview_previewer = 'open -a Preview'
nmap <space>x :LLPStartPreview<CR>


" using this only for neovide
let g:neovide_iso_layout=1

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

