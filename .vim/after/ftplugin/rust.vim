set syntax=rust
set foldmethod=syntax
syntax sync fromstart
nmap <Leader>t :call VimuxRunCommand("cargo test")<CR>
nmap <Leader>b :call VimuxRunCommand("cargo build")<CR>
nmap <Leader>r :call VimuxRunCommand("cargo run")<CR>
nmap <Leader>d :call VimuxRunCommand("cargo +nightly doc --open --document-private-items")<CR>
let g:rustfmt_autosave = 1
