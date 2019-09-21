" vim: set sw=2 sts=2 et ft=vim :
"
" To be safe side
set shell=bash
" Enable filetype based plugin indent control
filetype plugin indent on

" Syntax highlight and spelling
syntax on
"syntax off

" minimalist non-filetype-specific indenting
set autoindent
" More than autoindent
set smartindent

" Enable spell check with en_us for all
set spell
" Sell check with en_us
set spelllang=en_us

" minimalist encoding as utf-8
set encoding=utf-8
set fileencodings=utf-8

" make vim copy buffer bigger (default 50 lines: viminfo='100,<50,s10,h)
set viminfo='100,<5000,s100,h

" Allow to move cursor beyond for block
set virtualedit=block

"-----------------------------------------------------------------------------
" Use <SPACE> as leader instead of '\'
" In NORMAL mode, SPACE is useless.  This has to be before <leader> usage.
let mapleader = ' '

"-----------------------------------------------------------------------------
" From vim manual: ins-completion
"
" Auto complete <C-N> with <TAB> except when BOL or BOL+SPACEs
" (TAB may be used to indent line under "set expandtab")
"
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
" Auto complete <C-P> with <S-TAB> in non-BOL
"
function! CleverSTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<S-Tab>"
   else
      return "\<C-P>"
   endif
endfunction
inoremap <S-Tab> <C-R>=CleverSTab()<CR>


" Command line: (defaults)
"  ^B   BOL
"  ^E   EOL
"  ^F   Open the command-line window (NORMAL MODE like)
"  ^W   DEL-Word
"  ^U   DEL-Before (^E^B to DEL-line)
"  ^P   Previous line
"  ^N   Next line
"
" Add Ex MODE key binding for left-right-up-dn-del
" these should be minimal conflict choicees
"
" Use <BS> to delete char    (^H has minimal impact)
cnoremap <C-H> <Left>
" Use <Return> to enter line (^J has no negative) (but ^N usable)
"cnoremap <C-J> <Down>
" I don't use digraph (^K)                        (but ^P usable)  
"cnoremap <C-K> <Up>
" I don't use match under ... feature (^L)
cnoremap <C-L> <Right>
" I don't see any usage of ^X in Ex MODE
cnoremap <C-X> <DEL>
"-----------------------------------------------------------
" (*) readline-like bindings which are mentioned in vim manual:  
" cmdline-editing -- These are not used to avoid confusion
" READLINE: beginning-of-line (*) --> ^B does this in Vim
" ^A seems to be used for command-line completion
"cnoremap <C-A> <Home>
" READLINE: end-of-line (not in example since this is Vim default)
"cnoremap <C-E> <End>
" READLINE: forward-char (*) 
" Usually cedit is set to ^F to open the command-line window
"cnoremap <C-F> <Right>
" READLINE: backward-char (*)
" Vim uses this for BOL
"cnoremap <C-B> <Left>
" --- OK but ...
" READLINE: backward-word (*)
"cnoremap <Esc>b <S-Left>
" READLINE: forward-word (*)
"cnoremap <Esc>f <S-Right>

"----------------------------------------------------------------------
" Now that I map ^H and ^L in COMMAND MODE, 
" Let's do the similar in INSERT MODE
"
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

"----------------------------------------------------------------------
" From #vim Recommendations
" https://www.vi-improved.org/recommendations/
"
" Add all files in the same directory of the one in the current buffer
nnoremap <leader>a :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>

" Display all buffers and prompt buffer
nnoremap <leader>b :b <C-d>

" Prompt for filename entry (partial+TAB OK) to find one file under tree 
nnoremap <leader>e :e **/

" drops me to the grep line (|cw)
nnoremap <leader>g :grep<space>

" :Ilist to go into a quickfix window (|cw)
nnoremap <leader>i :Ilist<space>

" lands me on a taglist jump command line
nnoremap <leader>j :tjump /

" runs make
nnoremap <leader>m :make<cr>

" strips whitespace
nnoremap <leader>s :call StripTrailingWhitespace()<cr>
" Better better-whitespace including zenkaku-space
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/[\u3000[:space:]]\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

" switches to the last buffer to (q)uickswitch back
nnoremap <leader>q :b#<cr>

" runs :TTags but on the current file, lands me on a prompt to filter the tags
nnoremap <leader>t :TTags<space>*<space>*<space>.<cr>

" ...........................................................................
" From mhinz/vim-galore https://github.com/mhinz/vim-galore
" Saner CTRL-L to redraw screen (l->w)
nnoremap <leader>w :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" ...........................................................................
" PERSONAL

 nnoremap <leader>l :ls<CR>
 nnoremap <leader>c :cw<CR>
 nnoremap <leader>n :cnext<CR>
 nnoremap <leader>p :cprev<CR>
 nnoremap <leader>d :bufdo<space>
" ---------------------------------------------------------------------------
" PERSONAL REMAP
"
"" Set-up buffer pasting
set nopaste
set pastetoggle=<f2>

" Remap to apply Macro with "Q" ("qq" to record, "qq" to quit, "Q" to apply)
nnoremap Q @q
xnoremap Q :norm @q<cr>

" Map quick "kj"   to enter "<ESC>" in insert mode (remember as "knee jerk")
" Map quick "kjk"  to enter "kj"    in insert mode (or wait after "k")
" Use quick "kjkk" to enter "kjk"   in insert mode
inoremap kjk kj
inoremap kj  <Esc>

tnoremap kjk kj
tnoremap kj  <C-W>N
"-----------------------------------------------------------------------------
" From mhinz/vim-galore
" https://github.com/mhinz/vim-galore

" Remap in visual mode < > related
" (This kills normal use of . after > but more visible)
xnoremap > >gv
xnoremap < <gv
" Don't remap <TAB> in NORMAL

" For smarter command line <c-n>t<c-p>
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

" Disable audible and visual bells
set noerrorbells
set novisualbell
set t_vb=

" cursorline in-NORMAL (and starting)
augroup MyCursor
  au!
  autocmd InsertLeave,WinEnter,VimEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
augroup END

" Faster keyword completion with <c-n>/<c-p> (and <TAB> remapped)
set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags

set nolist        " Don't Show non-printable characters as default
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:»,precedes:«,nbsp:␣'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:='
endif

"zv to make sure to show
nnoremap gg  ggzv
nnoremap G   Gzv
nnoremap g;  g;zvzz
nnoremap g,  g,zvzz

nnoremap <c-i>  <c-i>zvzz
nnoremap <c-o>  <c-o>zvzz


"-----------------------------------------------------------------------------
" Rendering fast
set ttyfast
" Cursor motion
"set scrolloff=5
set nostartofline

" open another file without saving the current file
set hidden
" Alternative -- always write
" set confirm
" set autowriteall

" When the last window have a status line: Always=2
set laststatus=2
" Maximum internal statusline with full path
"set statusline=%<%F%m%r%h%w[U+%04B]%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
"              | | | | | |    |    |  |      |     |   |  |  |    +-- current % into file
"              | | | | | |    |    |  |      |     |   |  |  +-- Virtual column number
"              | | | | | |    |    |  |      |     |   |  +-- current column
"              | | | | | |    |    |  |      |     |   +-- number of lines
"              | | | | | |    |    |  |      |     +-- current line
"              | | | | | |    |    |  |      +-- current syntax
"              | | | | | |    |    |  +-- current fileformat
"              | | | | | |    |    +-- separation point
"              | | | | | |    +  Unicode (hex)
 nnoremap <leader>n :bnext<CR>
"              | | | | | +-- preview flag in square brackets
"              | | | | +-- help flag in square brackets
"              | | | +-- readonly flag in square brackets
"              | | +-- modified flag in square brackets
"              | +-- full path to file in the buffer
"              +-- truncate here
" Maximum internal statusline with full path from PWD or as typed
" set statusline=%<%f%m%r%h%w[U+%04B]%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
" Maximum internal statusline with file name (tail)
" set statusline=%<%t%m%r%h%w[U+%04B]%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
set statusline=%<%t%m%r%h%w%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
"
" Display mode
set nowrap
" Insert, Replace or Visual mode put a message on the last line
set showmode
" Show (partial) command in the last line
set showcmd
" Tab completion for command
set wildmenu

"
"
"
" filler
