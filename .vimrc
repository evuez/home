set nocompatible
filetype off

" Set leader to ','
let mapleader=','
let maplocalleader=','

" List plugins
call plug#begin('~/.vim/bundle')
"" Fuzzy finder
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
"" Color scheme
Plug 'dracula/vim', {'as': 'dracula'}
"" Other plugins
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-surround'
"" Language plugins
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'elixir-editors/vim-elixir', {'for': ['elixir', 'eelixir']}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'ap/vim-css-color', {'for': ['scss', 'css']}
Plug 'ElmCast/elm-vim', {'for': 'elm'}
Plug 'hellerve/carp-vim', {'for': 'carp'}
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'ts', 'typescriptreact', 'tsx']}
Plug 'peitalin/vim-jsx-typescript', {'for': ['typescriptreact', 'tsx']}
Plug 'gleam-lang/gleam.vim', {'for': 'gleam'}
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
nnoremap * /\<<C-R>=expand('<cword>')<CR>\>\C<CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>

" Make Q repeat the last macro
nnoremap Q @@

" Show info along bottom
set ruler

" Visual bell instead of beep
set visualbell

" Auto-indent
set autoindent

" Do not wrap text
set nowrap

" Disable cursor blink
set guicursor=a:blinkon0

" Remove trailing spaces on save
au BufWritePre * :%s/\s\+$//e

" Save swap files in a common directory
set directory^=$HOME/.vim/swap//

if has('nvim')
  " Show the effect of `:s//` incrementally
  set inccommand=nosplit
endif

" Completion options
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
set complete+=kspell

"""
""" Filetype specific settings
"""

" Enable spellcheck for *.md and gitcommit
au BufRead,BufNewFile *.md setlocal spell
au FileType gitcommit setlocal spell

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
au FileType markdown set wrap linebreak
au FileType tex set wrap linebreak

"""
""" Plugin settings
"""

""" FZF
" Hide preview window
let g:fzf_preview_window = ''

" Use a leader instead of the actual named binding
nmap <leader>p :Files<cr>

" Search through open buffers
nmap <leader>b :Buffers<cr>

" Search through tags
nmap <leader>tt :Tags<cr>
nmap <leader>tw :Tags <C-R>=expand('<cword>')<cr><cr>

" Search with ripgrep
nmap <leader>r :Rg <C-R>=expand('<cword>')<cr><cr>

""" GitMessenger
nmap <leader>g :GitMessenger<cr>

" Remove default `gm` mapping
let g:git_messenger_no_default_mappings=v:true

" Autofocus the popup
let g:git_messenger_always_into_popup=v:true

""" elm-vim
" Disable bindings
let g:elm_setup_keybindings=0

"""
""" Bindings
"""

" Copy current file path
nmap <leader>cp :let @+ = expand("%")<cr>
nmap <leader>cl :let @+ = expand("%") . ":" . line(".")<cr>

" Search for visually selected text
vnoremap // y/<C-R>"<CR>
