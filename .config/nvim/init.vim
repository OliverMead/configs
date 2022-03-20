" set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/after
" let &packpath = &runtimepath
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

call plug#begin('~/.config/nvim/plugged')
Plug 'jamessan/vim-gnupg'
Plug 'psliwka/vim-redact-pass'

Plug 'lilyinstarlight/vim-sonic-pi'

Plug 'vim-scripts/loremipsum'

" " Documents
Plug 'vim-latex/vim-latex', { 'for': 'tex' }
" tabular and markdown go hand-in-hand
Plug 'godlygeek/tabular'

" " Appearance
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'machakann/vim-highlightedyank'

Plug 'Chiel92/vim-autoformat' ", { 'for': ['c', 'cpp', 'java'] }
au BufWrite *.c,*.cpp,*.h,*.java :Autoformat

" Plug 'ludovicchabant/vim-gutentags', { 'for' : ['c', 'java', 'python', 'haskell'] }

"
" " Language Specific
Plug 'cespare/vim-toml', { 'for' : 'toml' }
Plug 'meck/vim-brittany', { 'for' : 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for' : 'haskell' }
" Plug 'zenzike/vim-haskell'

Plug 'davidhalter/jedi-vim', { 'for' : 'python' }
Plug 'jpalardy/vim-slime', { 'for' : 'python' }

Plug 'lkdjiin/vim-foldcomments'

" " Git and Hub integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" " UNIX Helper
Plug 'tpope/vim-eunuch'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-sort-motion'

Plug 'salsifis/vim-transpose'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-indent'
Plug 'sgur/vim-textobj-parameter'
Plug 'Julian/vim-textobj-variable-segment'
call plug#end()

let mapleader=" "
let g:gruvbox_italic=1
if (&term != "linux")
    colorscheme gruvbox
    set background=dark
endif
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_light="hard"
let g:gruvbox_contrast_dark="soft"

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

" let g:airline_powerline_fonts = 1
" let g:airline_theme='base16_gruvbox_dark_hard'

let g:slime_target = "tmux"

au filetype c set tags+=~/.config/nvim/systags
au filetype c packadd termdebug
let g:termdebug_wide=1
command! MakeTags !ctags -R .
command! SysTags !ctags -R -f ~/.config/nvim/systags /usr/include /usr/local/include
nmap <leader><Leader> :MakeTags<CR>
nmap <leader>s :SysTags<CR>
nmap <C-P> :bp<CR>
nmap <C-N> :bn<CR>
nmap <M-x> :
imap <M-x> <C-o>:

autocmd FileType help wincmd L
autocmd FileType man wincmd L
syntax on
syntax spell toplevel
set nocp
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete
set dictionary+=/usr/share/dict/words
set nohls
set path+=**
set wildmenu
set spell
"set wrap!
set number
" set relativenumber
set cursorline
set cursorcolumn
set clipboard+=unnamedplus
set mouse+=a
set hidden
if exists('&inccommand')
    set inccommand=split
endif
set tabstop=4 shiftwidth=4 expandtab
set so=999
hi SpellBad cterm=underline
set sessionoptions="blank,buffers,sesdir,folds,help,options,winsize,terminal,resize,localoptions"
map <F3> :w ! wc -c<CR>
au filetype tex map <F3> :w !detex \| wc -w<CR>
" au filetype nroff map <Leader>gr :! refer -PeSp ~/Documents/bibliography.refer % \| groff -ms -T pdf> %:r.pdf<CR>
" au filetype nroff map <Leader>tc :! qpdf --empty %:r.pdf --pages %:r.pdf 1,r1,2-r2 --<CR>

map <C-s> :hi clear search<CR>

function! Sign(x)
    if a:x>-1
        return 1
    else
        return -1
    endif
endfunction

nnoremap <Leader>e $T=y$o= <C-r>=<C-r>"<CR><C-[>+
nnoremap <Leader>E ^y$o = <C-r>=<C-r>"<CR><C-[>+

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
nnoremap <Leader>tn :tabnew<cr>

nnoremap <Leader>w <C-w>

nmap <Up> <nop>
imap <Up> <nop>
nmap <Down> <nop>
imap <Down> <nop>
nmap <Left> <nop>
imap <Left> <nop>
nmap <Right> <nop>
imap <Right> <nop>

nmap <C-Up> <nop>
imap <C-Up> <nop>
nmap <C-Down> <nop>
imap <C-Down> <nop>
nmap <C-Left> <nop>
imap <C-Left> <nop>
nmap <C-Right> <nop>
imap <C-Right> <nop>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

tnoremap <C-W> <Esc>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-t> <C-\><C-n>:b #<CR>

" autocmd FileType *.toml,Gopkg.lock,Cargo.lock,*/.cargo/config,*/.cargo/credentials,Pipfile setf toml

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

