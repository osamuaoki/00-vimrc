" vim: set sw=2 sts=2 et ft=vim :
" make vim copy buffer bigger (default 50 lines: viminfo='100,<50,s10,h)
set viminfo='100,<5000,s100,h

" Enable 256 colors (TERM=xterm-256color)
set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
"
" minimalist non-filetype-specific indenting
set autoindent
" More than autoindent
set smartindent

" Syntax highlight and spelling
syntax on
"syntax off

" Enable filetype based plugin indent control
filetype plugin indent on

" Enable spell check with en_us for all
set spell
" Sell check with en_us
set spelllang=en_us

" minimalist encoding as utf-8
set encoding=utf-8
set fileencodings=utf-8

" Turn off bell and use visualbell
"set visualbell
" Turn off bell and visualbell
set visualbell t_vb=

" show cursor line underlined
set cursorline

" Set-up buffer pasting
set nopaste
set pastetoggle=<f2>

" Remap to apply Macro with "Q" ("qq" to record, "qq" to quit, "Q" to apply)
nnoremap Q @q
xnoremap Q :norm @q<cr>

" Remap quick jk to to get out from insert mode
inoremap kj  <Esc>

" Remap in visual mode < > related
xnoremap > >gv
xnoremap < <gv
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>

" Rendering fast
set ttyfast
" Cursor motion
set scrolloff=5
set nostartofline

"if executable("ag")
"    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
"    set grepformat=%f:%l:%c:%m,%f:%l:%m
"endif

" open another file without saving the current file
set hidden
" Alternative -- always write
" set confirm
" set autowriteall

" When the last window have a status line: Always=2
set laststatus=2
" Maximum internal statusline with full path
set statusline=%<%F%m%r%h%w[U+%04B]%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
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
" set statusline=%<%t%m%r%h%w[U+%04B]%=[%{&ff}]%y\ (%4l/%4L,%3c%V)\ %P
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
