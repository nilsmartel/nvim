let g:ale_lsp_root = {}

let g:ale_rust_rls_toolchain = 'stable'
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'rust': ['rls'],
    \ 'crystal': ['srcy'],
    \ 'sh': ['language_server'],
    \ 'go': ['gometalinter'],
    \ }

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_lint_delay = 50

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '?'

" Airline is that nice and smooth and colorfull information line at the bottom
" of the window
let g:airline#extensions#ale#enabled = 1

nnoremap H :ALEHover<CR>
nnoremap gd :ALEGoToDefinition<CR>
nnoremap gh :ALEGoToDefinitionInSplit<CR>
nnoremap g2 :ALEGoToDefinitionInTab<CR>
" Note: gt and gT to change tabs, :tabclose, :tabedit {file} etc. work quite
" nice as well!
nnoremap g<tab> :ALEGoToDefinitionInVSplit<CR>
