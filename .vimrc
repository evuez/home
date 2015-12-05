
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers
set number

" Force wrap at col 72 for git commit bodies
au FileType gitcommit set tw=72
au FileType gitcommit call setpos('.', [0, 1, 1, 0])

" Leave hidden buffer open
set hidden

" Save up to 100 commands
set history=100

" Indentation options
set tabstop=4
set shiftwidth=4
set expandtab
