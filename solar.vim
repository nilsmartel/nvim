
"
" Recognize solar files
au BufNewFile,BufRead *.sol set filetype=solar
au FileType solar set syntax=julia

au BufNewFile,BufRead *.sol.ir set filetype=solar-ir
au FileType solar-ir set syntax=rust

" Recognize plain files
au BufNewFile,BufRead *.plain set filetype=plain
au FileType plain set syntax=go

" Recognize syntax files
au BufNewFile,BufRead *.syntax set syntax=haskell
