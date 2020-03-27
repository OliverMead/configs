set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
