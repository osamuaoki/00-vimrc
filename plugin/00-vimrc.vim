" vim: set sw=2 sts=2 et ft=vim :
"
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

" Turn off bell and use visualbell
"set visualbell
" Turn off bell and visualbell
set visualbell t_vb=

" show cursor line underlined
set cursorline

" Allow to move cursor beyond
set virtualedit=all

"-----------------------------------------------------------------------------
" Use <SPACE> as leader instead of '\'
" In NORMAL mode, SPACE is useless.  This has to be before <leader> usage.
let mapleader = ' '

"-----------------------------------------------------------------------------
" From vim manual: ins-completion
"
" Auto complete <C-N> with <TAB> in non-BOL
"
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

"----------------------------------------------------------------------
" From #vim Recommendations
" https://www.vi-improved.org/recommendations/
"
" lets me add files with wildcards
nnoremap <leader>a :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>

" lands me on the buffer prompt and displays all buffers
nnoremap <leader>b :b <C-d>

" similar to buffers but for opening a single file
nnoremap <leader>e :e **/

" drops me to the grep line
nnoremap <leader>g :grep<space>

" :ilist go into a quickfix window
nnoremap <leader>i :Ilist<space>

" lands me on a taglist jump command line
nnoremap <leader>j :tjump /

" runs make
nnoremap <leader>m :make<cr>

" strips whitespace
nnoremap <leader>s :call StripTrailingWhitespace()<cr>
" Better better-whitespace
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

" switches to the last buffer to (q)uickswitch back
nnoremap <leader>q :b#<cr>

" runs :TTags but on the current file, lands me on a prompt to filter the tags
nnoremap <leader>t :TTags<space>*<space>*<space>.<cr>

"-----------------------------------------------------------------------------
" From mhinz/vim-galore
" https://github.com/mhinz/vim-galore
"

" ---------------------------------------------------------------------------
" PERSONAL REMAP
"
"" Set-up buffer pasting
set nopaste
set pastetoggle=<f2>

" Remap to apply Macro with "Q" ("qq" to record, "qq" to quit, "Q" to apply)
nnoremap Q @q
xnoremap Q :norm @q<cr>

" Remap quick jk to to get out from insert mode (I don't use "kj" in insert mode)
inoremap kj  <Esc>

" Remap in visual mode < > related
" (This kills normal use of . after > but more visible)
xnoremap > >gv
xnoremap < <gv
" Don't remap <TAB> in NORMAL

" For smarter command line <c-n>t<c-p> https://github.com/mhinz/vim-galore
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

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
"              | | | | | +-- preview flag in square brackets
"              | | | | +-- help flag in square brackets
"              | | | +-- readonly flag in square brackets
"              | | +-- modified flag in square brackets
"              | +-- full path to file in the buffer
"              +-- truncate here
" Maximum internal statusline with full path from PWD or as typed
" set statusline=%<%f%m%r%h%w[U+%04B]%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
" Maximum internal statusline with file name (tail)
set statusline=%<%t%m%r%h%w[U+%04B]%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
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
