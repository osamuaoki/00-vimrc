"============================================================================
"File:        00-vimrc.vim
"Description: Vim plugin for on the fly syntax checking.
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_vimrc_plugin') || &compatible
    finish
endif
let g:loaded_vimrc_plugin = 1

let s:vimrc_level =  get(g:, 'vimrc_level', 0)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use incremental search as defaultif s:vimrc_level > 0
set incsearch                  " Incremental search ON
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load matchit.vim, but only if the user hasn't installed a newer version.
if s:vimrc_level > 0
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
endif " s:vimrc_level > 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Break undo sequence: CTRL-G u
if s:vimrc_level > 0
if empty(mapcheck('<C-U>', 'i'))
  inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
  inoremap <C-W> <C-G>u<C-W>
endif
endif " s:vimrc_level > 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inspired by vim manual: ins-completion (with some twist)
"
" Auto complete <C-N> with <TAB> if tailing non-space character
" (TAB may be used to indent line under "set expandtab")
"
if s:vimrc_level > 0
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '\(^\|\s\)$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
" Auto complete <C-P> with <S-TAB> in non-BOL
"
function! CleverSTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '\(^\|\s\)$'
    return "\<S-Tab>"
  else
    return "\<C-P>"
  endif
endfunction
inoremap <S-Tab> <C-R>=CleverSTab()<CR>
endif " s:vimrc_level > 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor movament for COMMAND MODE and INSERT MODE
"
" Command line: (defaults)
"  ^B   BOL
"  ^E   EOL
"  ^F   Open the command-line window (NORMAL MODE like)
"  ^W   DEL-Word
"  ^U   DEL-Before (^E^B to DEL-line)
"  ^P   Previous line
"  ^N   Next line
"
" >>> Let's keep it simple not to reassign
"if s:vimrc_level > 1
"
" Add Ex MODE key binding for left-right-up-dn-del
" these should be minimal conflict choicees
"
" Use <BS> to delete char    (^H has minimal impact)
"cnoremap <A-H> <Left>
" Use <Return> to enter line (^J has no negative) (but ^N usable)
"cnoremap <A-J> <Down>
" I don't use digraph (^K)                        (but ^P usable)
"cnoremap <A-K> <Up>
" I don't use match under ... feature (^L)
"cnoremap <A-L> <Right>
" I don't see any usage of ^X in Ex MODE
"cnoremap <A-X> <Del>
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

" Now that I map ^H and ^L in COMMAND MODE,
" Let's do the similar in INSERT MODE
"
"inoremap <A-H> <Left>
"inoremap <A-J> <Down>
"inoremap <A-K> <Up>
"inoremap <A-L> <Right>
"inoremap <A-X> <Del>
"endif " if > 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up <leader> usage in NORMAL mode
"
if s:vimrc_level > 0
" I use <SPACE> as leader instead of '\'
" In NORMAL mode, SPACE is useless.  This has to be before <leader> usage.
let mapleader = ' '

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

" switches to the last buffer to (q)uickswitch back
nnoremap <leader>q :b#<cr>

" runs :TTags but on the current file, lands me on a prompt to filter the tags
nnoremap <leader>t :TTags<space>*<space>*<space>.<cr>

" From mhinz/vim-galore https://github.com/mhinz/vim-galore
" Saner CTRL-L to redraw screen (l->w)
"
nnoremap <leader>w :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" PERSONAL
"
nnoremap <leader>l :ls<CR>
nnoremap <leader>c :cw<CR>
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprev<CR>
nnoremap <leader>d :bufdo<space>

endif " if > 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PERSONAL REMAP
"
if s:vimrc_level > 0
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

"zv to make sure to show folds
"zz to redraw line at the center of screen
nnoremap gg  ggzv
nnoremap G   Gzv
nnoremap g;  g;zvzz
nnoremap g,  g,zvzz
nnoremap <c-i>  <c-i>zvzz
nnoremap <c-o>  <c-o>zvzz

endif " if > 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cursorline in-NORMAL (and starting)
"
if s:vimrc_level > 0
augroup MyCursor
  au!
  autocmd InsertLeave,WinEnter,VimEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
augroup END
endif " if >0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INSERT MODE
"
" Normally "," is followed by space.  So use it as leader key in NORMAL MODE
" CTRL-X is tough to type.
"
if s:vimrc_level > 1
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,o <C-x><C-o>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>
endif " if >1

"
" filler
" vim: set sw=2 sts=2 et ft=vim :
