set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/after
let &packpath = &runtimepath
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

call plug#begin('~/.config/nvim/plugged')
" " Documents
Plug 'vim-latex/vim-latex'

" " Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'itchyny/landscape.vim'
Plug 'machakann/vim-highlightedyank'

Plug 'dense-analysis/ale'
" " Language Specific
Plug 'cespare/vim-toml'
Plug 'meck/vim-brittany'
Plug 'rust-lang/rust.vim'
Plug 'edwinb/idris2-vim'
Plug 'neovimhaskell/haskell-vim'
" Plug 'zenzike/vim-haskell'
Plug 'artur-shaik/vim-javacomplete2'

Plug 'junegunn/goyo.vim'
Plug 'lkdjiin/vim-foldcomments'

Plug 'prabirshrestha/vim-lsp'

" " Git and Hub integration  
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" " UNIX Helper
Plug 'tpope/vim-eunuch'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-sort-motion'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-indent'
Plug 'sgur/vim-textobj-parameter'
Plug 'Julian/vim-textobj-variable-segment'
call plug#end()

let mapleader=" "
let g:gruvbox_italic=1
colorscheme gruvbox
set background=light
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_light="hard"
let g:gruvbox_contrast_dark="soft"

" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" Disable or enable loclist at the bottom of vim 
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0

let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['pylint'],
      \  'java': ['javac'],
      \  'haskell': ['ghc'],
      \  'c': ['gcc', 'avr-gcc']
      \ }

" let g:titlecase_map_keys=0
" nmap <leader>gt <Plug>Titlecase
" vmap <leader>gt <Plug>Titlecase
" nmap <leader>gT <Plug>TitlecaseLine

let g:netrw_banner=1
let g:netrw_liststyle=3

" let Tex_FoldedSections=""
" let Tex_FoldedEnvironments=""
" let Tex_FoldedMisc=""
let Tex_DefaultTargetFormat="pdf"
let g:Tex_GotoError=0
let g:Tex_CompileRule_pdf="pdflatex -shell-escape -interaction=nonstopmode -output-directory=build $*"
let Tex_ViewRule_pdf="zathura build/"
" let Tex_ViewRule_pdf="zathura"

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
" let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1

nnoremap <Leader>n /<+\+>/<CR>cf>

let g:airline_powerline_fonts = 1
let g:airline_theme='base16_gruvbox_dark_hard'

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
set omnifunc=syntaxcomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable
set spell
"set wrap!
set number
" set relativenumber
set cursorline
set cursorcolumn
" set clipboard+=unnamedplus
" set mouse+=a
set hidden
if exists('&inccommand')
  set inccommand=split
endif
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

function! Sign(x)
  if a:x>-1
    return 1
  else
    return -1
  endif
endfunction

nnoremap <Leader>e $T=y$o= <C-r>=<C-r>"<CR><C-[>+
nnoremap <Leader>E y$o = <C-r>=<C-r>"<CR><C-[>+

function! Sum(list) 
  let s = 0
  for n in a:list
    let s+=n
  endfor
  return s
endfunction

function! Dot(list1, list2)
  let result = []
  for i in range(len(a:list1))
    let result = add(result,get(a:list2, i) * get(a:list1, i))
  endfor
  return Sum(result)
endfunction

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

