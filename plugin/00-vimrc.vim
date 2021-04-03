"============================================================================
"File:        00-vimrc.vim
"Description: Vim plugin for all minor remaps
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PERSONAL SETTING REMAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ref: https://github.com/tpope/vim-sensible
" Ref: https://github.com/mhinz/vim-galore
"
if s:vimrc_level > 0
" Set-up buffer pasting
set nopaste
set pastetoggle=<f2>

" Remap to apply Macro with "Q" ("qq" to record, "qq" to quit, "Q" to apply)
nnoremap Q @q
xnoremap Q :norm @q<cr>

" Use incremental search as default
set incsearch                  " Incremental search ON

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" From mhinz/vim-galore https://github.com/mhinz/vim-galore
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

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" For python .... may be this is interesting
" See https://catonmat.net/vim-plugins-matchit-vim etc.

endif " s:vimrc_level > 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Break undo sequence: CTRL-G u
""""if s:vimrc_level > 0
""""if empty(mapcheck('<C-U>', 'i'))
""""  inoremap <C-U> <C-G>u<C-U>
""""endif
""""if empty(mapcheck('<C-W>', 'i'))
""""  inoremap <C-W> <C-G>u<C-W>
""""endif
""""endif " s:vimrc_level > 0
""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Set up <leader> usage in NORMAL mode
"""""
""""if s:vimrc_level > 0
""""" I use <SPACE> as leader instead of '\'
""""" In NORMAL mode, SPACE is useless.  This has to be before <leader> usage.
""""let mapleader = ' '
""""
""""" From #vim Recommendations
""""" https://www.vi-improved.org/recommendations/
"""""
""""" Add all files in the same directory of the one in the current buffer
""""nnoremap <leader>a :argadd <c-r>=fnameescape(expand('%:p:h'))<cr>/*<C-d>
""""
""""" Display all buffers and prompt buffer
""""nnoremap <leader>b :b <C-d>
""""
""""" Prompt for filename entry (partial+TAB OK) to find one file under tree
""""nnoremap <leader>e :e **/
""""
""""" drops me to the grep line (|cw)
""""nnoremap <leader>g :grep<space>
""""
""""" :Ilist to go into a quickfix window (|cw)
""""nnoremap <leader>i :Ilist<space>
""""
""""" lands me on a taglist jump command line
""""nnoremap <leader>j :tjump /
""""
""""" runs make
""""nnoremap <leader>m :make<cr>
""""
""""" switches to the last buffer to (q)uickswitch back
""""nnoremap <leader>q :b#<cr>
""""
""""" runs :TTags but on the current file, lands me on a prompt to filter the tags
""""nnoremap <leader>t :TTags<space>*<space>*<space>.<cr>
""""
""""" From mhinz/vim-galore https://github.com/mhinz/vim-galore
""""" Saner CTRL-L to redraw screen (l->w)
"""""
""""nnoremap <leader>w :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
""""
""""" PERSONAL
"""""
""""nnoremap <leader>l :ls<CR>
""""nnoremap <leader>c :cw<CR>
""""nnoremap <leader>n :cnext<CR>
""""nnoremap <leader>p :cprev<CR>
""""nnoremap <leader>d :bufdo<space>
""""
""""endif " if > 0
""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" INSERT MODE
"""""
""""" Normally "," is followed by space.  So use it in INSERT MODE as if
""""" <space> is used as a leader key in NORMAL MODE
"""""
""""" CTRL-X is tough to type.
"""""
""""if s:vimrc_level > 1
""""inoremap <silent> ,f <C-x><C-f>
""""inoremap <silent> ,i <C-x><C-i>
""""inoremap <silent> ,l <C-x><C-l>
""""inoremap <silent> ,n <C-x><C-n>
""""inoremap <silent> ,o <C-x><C-o>
""""inoremap <silent> ,t <C-x><C-]>
""""inoremap <silent> ,u <C-x><C-u>
""""endif " if >1
""""
"
" filler
" vim: set sw=2 sts=2 et ft=vim :
