

let g:ale_rust_rls_toolchain = 'stable'
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1

let g:racer_cmd='/Users/nilsmartel/.cargo/bin/racer'
let g:racer_experimental_completer = 1
let g:deoplete#sources#rust#racer_binary='/Users/nilsmartel/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/Users/nilsmartel/.rust/source_code/rust/src'
let g:rust_bang_comment_leader = 1

let g:rustfmt_autosave = 1 " Format Rust Code when saving
let g:rust_clip_command = 'pbcopy' " When running :RustPlay link gets saved to clipboard
