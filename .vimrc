" .vimrc
"
" Author: Alan Evans <AlanWEvans@gmail.com>
"

syntax on
set modeline
set bg=dark

filetype plugin on
filetype plugin indent on
set ts=4 sw=4 sts=4 et

execute pathogen#infect()

if !exists("g:skeleton_replacements")
    let g:skeleton_replacements = {}
    function! g:skeleton_replacements.AUTHOR()
        return $AUTHOR
    endfunction

    function! g:skeleton_replacements.EMAIL()
        return $EMAIL
    endfunction
endif
