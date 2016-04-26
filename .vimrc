set nocompatible
filetype off

" Set leader to ','
let mapleader=','
let maplocalleader=','

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'rust-lang/rust.vim'
call vundle#end()


" Set default colorscheme
colorscheme Tomorrow-Night-Bright

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers
set number

" Force wrap at col 72 for Git commit bodies
au FileType gitcommit set tw=72
au FileType gitcommit call setpos('.', [0, 1, 1, 0])

" Set color column for Python
au FileType python set colorcolumn=80

" Set indentation options for Ruby
au FileType ruby set tabstop=2
au FileType ruby set shiftwidth=2

" Set syntax as Markdown for *.md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Auto wrap in markdown files
au FileType markdown set wrap

" Leave hidden buffer open
set hidden

" Autoread file modifications
set autoread

" Save up to 100 commands
set history=100

" Indentation options
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Enable incremental search
set incsearch

" Make searches case insensitive
set ignorecase

" Make searches case sensitive if search starts with a capital
set smartcase

" Show info along bottom
set ruler

" Visual bell instead of beep
set visualbell

" Auto-indent
set autoindent

" Do not wrap text
set nowrap

" Auto-reload files
set autoread

" Disable cursor blink
set guicursor=a:blinkon0

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

""" CtrlP settings
" Ignore commonly ignored directory and files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Set cwd at the level of the nearest .git directory
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Search for visually selected text
vnoremap // y/<C-R>"<CR>
