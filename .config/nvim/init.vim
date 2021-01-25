set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/after
let &packpath = &runtimepath
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
call plug#begin('~/.config/nvim/plugged')

" " Documents
" Plug 'vim-latex/vim-latex'

" " Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'machakann/vim-highlightedyank'

" " Language Specific
" Plug 'cespare/vim-toml'
Plug 'meck/vim-brittany'
Plug 'rust-lang/rust.vim'
Plug 'edwinb/idris2-vim'
Plug 'neovimhaskell/haskell-vim'
" Plug 'zenzike/vim-haskell'

" Plug 'junegunn/goyo.vim'
" Plug 'lkdjiin/vim-foldcomments'
" Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/nerdcommenter'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons'
"
" " Git and Hub integration  
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Plug 'tpope/vim-tbone'
" Plug 'tpope/vim-obsession'
" " UNIX Helper
Plug 'tpope/vim-eunuch'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'inkarkat/vim-ReplaceWithRegister'
" Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-sort-motion'
" Plug 'christoomey/vim-system-copy'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
" Plug 'vimtaku/vim-textobj-keyvalue'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-line'
Plug 'sgur/vim-textobj-parameter'
Plug 'Julian/vim-textobj-variable-segment'

"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete.vim'

call plug#end()

let mapleader=" "
let g:gruvbox_italic=1
colorscheme gruvbox
set background=light
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_light="hard"
let g:gruvbox_contrast_dark="soft"

let g:titlecase_map_keys=0
nmap <leader>gt <Plug>Titlecase
vmap <leader>gt <Plug>Titlecase
nmap <leader>gT <Plug>TitlecaseLine

let g:netrw_banner=0
let g:netrw_liststyle=3

" let Tex_FoldedSections=""
" let Tex_FoldedEnvironments=""
" let Tex_FoldedMisc=""
let Tex_DefaultTargetFormat="pdf"
let g:Tex_GotoError=0
let g:Tex_CompileRule_pdf="pdflatex -shell-escape -interaction=nonstopmode -output-directory=build $*"
let Tex_ViewRule_pdf="zathura build/"
let Tex_ViewRule_pdf="zathura"

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
" let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1

nnoremap <Leader>< /<+\+>/<CR>cf>

let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'

command! MakeTags !ctags -R .
nmap <leader><Leader> :MakeTags<CR>
nmap <C-P> :bp<CR>
nmap <C-N> :bn<CR>
nmap <M-x> :
imap <M-x> <C-o>:

syntax on
syntax spell toplevel
set foldmethod=manual
au BufReadPost,BufWinEnter *.lytex set syntax=tex
au BufReadPost,BufWinEnter *.rs set filetype=rust
au BufReadPost,BufwinEnter *.hs set filetype=haskell
"au BufReadPost *.rs set foldmethod=syntax
au BufReadPost,BufWinEnter *.java set syntax=java
au BufReadPost,BufWinEnter *.java set foldmethod=syntax
filetype plugin indent on

set nohls
set path+=**
set wildmenu
set spell
"set wrap!
set number
set relativenumber
set cursorline
set cursorcolumn
" set clipboard+=unnamedplus
set mouse+=a
set hidden
set inccommand=nosplit
set tabstop=2 shiftwidth=2 expandtab
set so=999
"set splitright
"set splitbelow
"hi clear SpellBad
hi SpellBad cterm=underline
set sessionoptions="blank,buffers,sesdir,folds,help,options,winsize,terminal,resize,localoptions"
map <F3> :w ! wc -c<CR>
au filetype tex map <F3> :w !detex \| wc -w<CR>
au filetype markdown map <Leader>md :! compileMD "%:p"<CR>
au filetype nroff map <Leader>gr :! refer -PeSp ~/Documents/bibliography.refer % \| groff -ms -T pdf> %:r.pdf<CR>
au filetype nroff map <Leader>tc :! qpdf --empty %:r.pdf --pages %:r.pdf 1,r1,2-r2 --<CR>

map <C-s> :hi clear search<CR>

nnoremap <Leader>tj  :tabnext<CR>
nnoremap <Leader>tk  :tabprev<CR>
nnoremap <Leader>tl  :tablast<CR>
nnoremap <Leader>th :tabfirst<CR>
nnoremap <Leader>tt  :tabedit<Space>
nnoremap <Leader>td  :tabclose<CR>

nnoremap <Leader>w <C-w>

nmap <Up> <nop>
imap <Up> <nop>
nmap <Down> <nop>
imap <Down> <nop>
nmap <Left> <nop>
imap <Left> <nop>
nmap <Right> <nop>
imap <Right> <nop>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

tnoremap <C-W> <Esc>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-t> <C-\><C-n>:b #<CR>

autocmd FileType *.toml,Gopkg.lock,Cargo.lock,*/.cargo/config,*/.cargo/credentials,Pipfile setf toml

" augroup IdrisCtags
"     au!
"     au BufWritePost idris* MakeTags
" augroup END

augroup QuickNotes
    autocmd!
    autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
    autocmd BufWinEnter ?* silent! loadview
augroup END

augroup numberToggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber number
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber number
augroup END

