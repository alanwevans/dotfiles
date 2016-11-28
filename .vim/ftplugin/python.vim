" http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces

highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace:
:match ExtraWhitespace /\s\+$/

:autocmd InsertLeave * redraw!

" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
setl smartindent
setl fileformat=unix
setl encoding=utf-8
