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

call plug#begin()
    " for using neovim in Firefox
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

    " Formatting related
    Plug 'chiel92/vim-autoformat'
    Plug 'rstacruz/vim-closer'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    " Finding and Opening Files
    Plug 'cloudhead/neovim-fuzzy'

    " hightlights selections of text when substituting
    Plug 'markonm/traces.vim'

    " Live editing
    Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
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

    " Language specific
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


" # Nice keybindings
" Set the <esc> key to something more accessible
inoremap J <esc>
inoremap F :Autoformat<cr>

" Alternative formatting system:
" nnoremap <c-f> :call CocAction('format')<CR>


" 1.) Go to definition
" 2.) center result
nmap gd :call CocAction('jumpDefinition', 'tab drop')<CR> zz

" Mappings for convinience
nmap O :CocAction<CR>
nmap <space>f :FuzzyOpen<cr>
nmap <space>g :FuzzyGrep<cr>

" Open window to a given side
" and open finder window
nmap <space>k :sp<cr><c-w>k:FuzzyOpen<cr>
nmap <space>j :sp<cr>:FuzzyOpen<cr>
nmap <space>l :vsp<cr>:FuzzyOpen<cr>
nmap <space>h :vsp<cr><c-w>h:FuzzyOpen<cr>


" Moving Window sizes
nmap <c-l> <c-w><
nmap <c-h> <c-w>>
nmap <c-j> <c-w>-
nmap <c-k> <c-w>+

nmap <space><space> :Commentary<cr>

" Highlight the current line
set cul

" Plugin Specific
    " Get Slime to work
let g:slime_target = "tmux"

" Proper use of Selection
autocmd InsertLeave, CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


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

" Language Agnostic sources
au FileType go source ~/.config/nvim/configs/go.vim
au FileType julia source ~/.config/nvim/configs/julia.vim
au FileType latex,tex source ~/.config/nvim/configs/latex.vim
au FileType html,javascript,typescript,typescriptreact,json,yaml source ~/.config/nvim/configs/webdev.vim

" Colorscheme selection
colorscheme xcodedark
set termguicolors

""" START Solar development
"
    " Recognize solar files
    au BufNewFile,BufRead *.sol set filetype=solar
    au FileType solar set syntax=haskell

    au BufNewFile,BufRead *.sol.ir set filetype=solar-ir
    au FileType solar-ir set syntax=rust

    " Recognize plain files
    au BufNewFile,BufRead *.plain set filetype=plain
    au FileType plain set syntax=go

    " Recognize syntax files
    au BufNewFile,BufRead *.syntax set syntax=haskell

""" END Solar development

" Recognize crystal
au BufNewFile,BufRead *.cr set filetype=crystal
" au FileType solar set syntax=ruby


" latex live preview opened with :LLPStartPreview
let g:livepreview_previewer = 'open -a Preview'
nmap <space>x :LLPStartPreview<CR>


" using this only for neovide
let g:neovide_iso_layout=1
