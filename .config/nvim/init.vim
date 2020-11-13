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

" " Language Specific
" Plug 'cespare/vim-toml'
"Plug 'alx741/vim-hindent'
Plug 'meck/vim-brittany'
Plug 'rust-lang/rust.vim'
Plug 'edwinb/idris2-vim'
Plug 'neovimhaskell/haskell-vim'

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
set background=dark
let g:gruvbox_termcolors=256

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
" let g:Tex_GotoError=0
" let g:Tex_CompileRule_pdf="pdflatex -shell-escape -interaction=nonstopmode -output-directory=build $*"
" let Tex_ViewRule_pdf="zathura build/"
let Tex_ViewRule_pdf="zathura"

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 1

nnoremap <Leader>< /<+\+>/<CR>cf>

let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist'

"let g:lsp_signs_enabled = 1         " enable signs
"let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

command! MakeTags !ctags -R .
nmap <leader>t :MakeTags<CR>
nmap <C-P> :bp<CR>
nmap <C-N> :bn<CR>
nmap <C-?> :
imap <C-?> <C-[>:

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
"set mouse=a
set tabstop=2 shiftwidth=2 expandtab
"set splitright
"set splitbelow
"hi clear SpellBad
hi SpellBad cterm=underline
set sessionoptions="blank,buffers,sesdir,folds,help,options,winsize,terminal,resize,localoptions"
map <F3> :w !detex \| wc -w<CR>
map t<F3> :w ! wc -c<CR>
au filetype markdown map <Leader>md :! compileMD "%:p"<CR>
au filetype nroff map <Leader>gr :! refer -PeSp ~/Documents/bibliography.refer % \| groff -ms -T pdf> %:r.pdf<CR>
au filetype nroff map <Leader>tc :! qpdf --empty %:r.pdf --pages %:r.pdf 1,r1,2-r2 --<CR>
"map [[ ?{<CR>w99[{
"map ][ /}<CR>b99]}
"map ]] j0[[%/{<CR>
"map [] k$][%?}<CR>
map <C-s> :hi clear search<CR>
"nnoremap qq :wqa<CR>

"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
"imap <c-space> <Plug>(asyncomplete_force_refresh)

"nnoremap th  :tabfirst<CR>
"nnoremap K  gT
"nnoremap J  gt
"nnoremap tj  :tabnext<CR>
"nnoremap tk  :tabprev<CR>
"nnoremap tl  :tablast<CR>
"nnoremap tt  :tabedit<Space>
" nnoremap TT :tabedit %<CR>
"nnoremap tn  :tabnext<Space>
"nnoremap tm  :tabmove v:count1<CR>
nnoremap td  :tabclose<CR>
" Alternatively use
"nnoremap th :tabnext<CR>
"nnoremap tl :tabprev<CR>
"nnoremap tn :tabnew<CR>
"nnoremap term :tabnew \| terminal<CR>:startinsert<CR>
"nnoremap file :tabnew \| terminal ranger<CR>:startinsert<CR>
nnoremap <Leader>cmus :tabnew \| terminal screen cmus<CR>:startinsert<CR>

nnoremap <Leader>sq :wa \| mks! \| wa \| tabclose!<CR>
nnoremap <Leader>sw :wa \| mks! \| wa<CR>

nnoremap <Leader>sn :below vsplit <CR>
nnoremap <Leader>sv :below split <CR>
nnoremap <Leader>stn :below vsplit \| terminal<CR>:start<CR>
nnoremap <Leader>stv :below split \| terminal<CR>:start<CR>
"nnoremap <Leader>sfn :below vsplit \| terminal ranger<CR>:start<CR>
"nnoremap <Leader>sfv :below split \| terminal ranger<CR>:start<CR>
nnoremap <Leader>sfn :below vsplit \| Explore<CR>
nnoremap <Leader>sfv :below split \| Explore<CR>
nnoremap <Leader>sff :Explore<CR>
nnoremap <Leader>sft :Texplore

"nnoremap bj :new <CR>
"nnoremap bk :new <CR>
"nnoremap bl :vnew <CR>
"nnoremap bh :vnew <CR>

nnoremap <Leader>w <C-w>

"nnoremap wh :wincmd h<CR>
"nnoremap wj :wincmd j<CR>
"nnoremap wk :wincmd k<CR>
"nnoremap wl :wincmd l<CR>
"nnoremap WH :wincmd H<CR>
"nnoremap WJ :wincmd J<CR>
"nnoremap WK :wincmd K<CR>
"nnoremap WL :wincmd L<CR>
"nnoremap wH :wincmd H<CR>
"nnoremap wJ :wincmd J<CR>
"nnoremap wK :wincmd K<CR>
"nnoremap wL :wincmd L<CR>
"nnoremap w> :<C-u>exe v:count1 . "wincmd >"<CR>
"nnoremap w< :<C-u>exe v:count1 . "wincmd <"<CR>
"nnoremap w+ :<C-u>exe v:count1 . "wincmd +"<CR>
"nnoremap w- :<C-u>exe v:count1 . "wincmd -"<CR>
"nnoremap w= :wincmd =<CR>
"nnoremap wo :call MaximizeToggle()<CR>

"nmap <C-h> :wincmd h<CR>
"nmap <C-j> :wincmd j<CR>
"nmap <C-k> :wincmd k<CR>
"nmap <C-l> :wincmd l<CR>

" nmap <Up> <nop>
" imap <Up> <nop>
" nmap <Down> <nop>
" imap <Down> <nop>
" nmap <Left> <nop>
" imap <Left> <nop>
" nmap <Right> <nop>
" imap <Right> <nop>

" map <leader>n :NERDTreeToggle<CR>

nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

" nnoremap z# ma:%g /\/\*/ normal! za<CR>:hi clear search<CR>'azz:delmarks a<CR>
"nnoremap z~ ma:%g /\/\*\*/ normal! zf/\*\/<CR>:hi clear search<CR>'azz
":delmarks a<CR>
" nnoremap z~ :%g /\/\*/ normal! zo<CR>:hi clear search<CR>\`\` zz

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

tnoremap <C-W> <Esc>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-t> <C-\><C-n>:b #<CR>

autocmd FileType *.toml,Gopkg.lock,Cargo.lock,*/.cargo/config,*/.cargo/credentials,Pipfile setf toml

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

