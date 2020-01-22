" Use Ruby Syntax Highlighting for Crystal
autocmd BufNewFile,BufRead *.cr set filetype=crystal
autocmd BufNewFile,BufRead *.cr set syntax=ruby
" Use C++ Highlighting for Metal
autocmd BufNewFile,BufRead *.metal set filetype=cpp
" Use C Hightlighting for OpenCl
autocmd BufNewFile,BufRead *.ocl set filetype=c


autocmd BufNewFile,BufRead *.ts set filetype=typescript


set hidden " What the fuck is this command doing?

call plug#begin()
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    " Also add Glaive, which is used to configure codefmt's maktaba flags. See
    " `:help :Glaive` for usage.
    Plug 'google/vim-glaive'

    Plug 'cloudhead/neovim-fuzzy'
    Plug 'elmcast/elm-vim'
    Plug 'tpope/vim-fugitive'
    Plug 'jpalardy/vim-slime'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'alvan/vim-closetag'
    Plug 'rust-lang/rust.vim'
    Plug 'cespare/vim-toml'
    Plug 'vim-scripts/L9'
    Plug 'morhetz/gruvbox'
    Plug 'udalov/kotlin-vim'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdtree'
    Plug 'w0rp/ale'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
    Plug 'sebastianmarkow/deoplete-rust'
    Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
    Plug 'itchyny/lightline.vim'
    " since I'm not sure, if it's getting used
    " Plug '/usr/local/opt/fzf'
    Plug 'vim-scripts/vim-auto-save'
    " Using deoplete instead
    Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
    " Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

    Plug 'wokalski/autocomplete-flow'" You will also need the following for function argument completion:
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'

    Plug 'gluon-lang/vim-gluon'
    " Another Language Server. Using this for gluon-lang
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
call plug#end()

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave, CompleteDone * if pumvisible() == 0 | pclose | endif
"
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Haskell related
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Open File Explorer
nmap @ :NERDTreeToggle<CR>

colorscheme gruvbox
set background=dark " use the dark Color Scheme

" Lead Helptags (e.g. for ALE)
packloadall
silent! helptags ALL

source ~/.config/nvim/configs/ale.vim
au FileType go source ~/.config/nvim/configs/go.vim
au FileType rust source ~/.config/nvim/configs/rust.vim
let g:slime_target = "tmux"


" let g:auto_save=1

nnoremap <C-p> :FuzzyOpen<CR>


if executable('gluon_language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'gluon_language-server',
    \ 'cmd': {server_info->['gluon_language-server']},
    \ 'whitelist': ['gluon'],
    \ })
endif
