set nocompatible
filetype off

" Set leader to ','
let mapleader=','
let maplocalleader=','

" List plugins
call plug#begin('~/.vim/bundle')
Plug 'ctrlpvim/ctrlp.vim'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'elixir-lang/vim-elixir', {'for': 'elixir'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'dracula/vim', {'as': 'dracula'}
call plug#end()

" Set default color scheme
colorscheme dracula

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers
set number
set relativenumber

" Disable mouse click
set mouse-=a

" Leave hidden buffer open
set hidden

" Autoread file modifications
set autoread

" Save up to 100 commands
set history=100

" Indentation options
set tabstop=2
set shiftwidth=2
set expandtab

" Set background color
hi Normal ctermbg=NONE guibg=NONE

" Highlight current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Highlight current column
set cursorcolumn

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
au BufWritePre * :%s/\s\+$//e

" Save swap files in a common directory
set directory^=$HOME/.vim/swap//

"""
""" Filetype specific settings
"""

" Force wrap at col 72 for Git commit bodies
au FileType gitcommit set tw=72
au FileType gitcommit call setpos('.', [0, 1, 1, 0])

" Set color column for Python and Elixir
au FileType python set colorcolumn=80
au FileType elixir set colorcolumn=90

" Set indentation options for Python
au FileType python set tabstop=4
au FileType python set shiftwidth=4

" Set syntax as Markdown for *.md files
au BufNewFile,BufReadPost *.md set filetype=markdown

" Auto wrap in markdown and LaTeX files
au FileType markdown set wrap
au FileType tex set wrap

" Set light color scheme for LaTeX files
au FileType tex colorscheme pencil

"""
""" Plugin settings
"""

""" CtrlP settings
" Ignore commonly ignored directory and files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|_build|env|deps|priv\/static|tmp|coverage|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Set cwd at the level of the nearest .git directory
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :Files<cr>

" Easy bindings for its various modes
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

"""
""" Bindings
"""

" Search through open buffers
nmap <leader>bb :Buffers<cr>

" Copy current's file path
nmap <leader>cp :let @+ = expand("%")<cr>
nmap <leader>cl :let @+ = expand("%") . ":" . (line(".") + 1)<cr>

" Search for visually selected text
vnoremap // y/<C-R>"<CR>
