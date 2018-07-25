" .vimrc
"
" Author: Alan Evans <AlanWEvans@gmail.com>
"

" See: http://www.rosipov.com/blog/vim-pathogen-and-git-submodules/
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
set modeline
set bg=dark

filetype plugin on
filetype plugin indent on
set ts=4 sw=4 sts=4 et

if !exists("g:skeleton_replacements")
    let g:skeleton_replacements = {}
    function! g:skeleton_replacements.AUTHOR()
        return $AUTHOR
    endfunction

    function! g:skeleton_replacements.EMAIL()
        return $EMAIL
    endfunction
endif
