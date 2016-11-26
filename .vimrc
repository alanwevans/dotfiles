" .vimrc
"
" Author: Alan Evans <AlanWEvans@gmail.com>
" 

set modeline
setl ts=4 sts=4 sw=4 et

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
