" Go related configurations

" Generally a lot of hightlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

" IntelliJ like Autoimport
let g:go_fmt_command = "goimports"

" Go to Definition
au FileType go nnoremap gt :GoDeclsDir<cr>
au FileType go nmap gd <Plug>(go-def)

au FileType go nnoremap H K

" Show information about variables on hover
let g:go_auto_type_info = 1
