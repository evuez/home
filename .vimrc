set nocompatible
filetype off

" Set leader to ','
let mapleader=','
let maplocalleader=','

" List plugins
call plug#begin('~/.vim/bundle')
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'elixir-editors/vim-elixir', {'for': ['elixir', 'eelixir']}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'reedes/vim-colors-pencil', {'as': 'pencil', 'for': 'tex'}
Plug 'ap/vim-css-color', {'for': ['scss', 'css']}
Plug 'ElmCast/elm-vim', {'for': 'elm'}
Plug 'hellerve/carp-vim', {'for': 'carp'}
call plug#end()

" Use true colors
set termguicolors

" Set default color scheme
silent! colorscheme dracula

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
hi CursorLine term=bold cterm=bold

" Highlight current column
set cursorcolumn

" Enable incremental search
set incsearch

" Make searches case insensitive
set ignorecase

" Make searches case sensitive if search starts with a capital
set smartcase

" Make * and # case sensitive
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

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

" Completion options
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"""
""" Filetype specific settings
"""

" Force wrap at col 72 for Git commit bodies
au FileType gitcommit set tw=72
au FileType gitcommit call setpos('.', [0, 1, 1, 0])

" Set color column for Python
au FileType python set colorcolumn=80

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

""" FZF
" Use a leader instead of the actual named binding
nmap <leader>p :Files<cr>

" Search through open buffers
nmap <leader>bb :Buffers<cr>

" Search through files history
nmap <leader>bs :History<cr>

" Search through tags
nmap <leader>t :Tags<cr>

"""
""" Bindings
"""

" Copy current's file path
nmap <leader>cp :let @+ = expand("%")<cr>
nmap <leader>cl :let @+ = expand("%") . ":" . line(".")<cr>

" Search for visually selected text
vnoremap // y/<C-R>"<CR>
