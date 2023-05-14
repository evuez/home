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
Plug 'neovim/nvim-lspconfig'

Plug 'ElmCast/elm-vim', {'for': 'elm'}
Plug 'rescript-lang/vim-rescript', {'for': 'rescript'}
Plug 'LnL7/vim-nix', {'for': 'nix'}
Plug 'ap/vim-css-color', {'for': ['scss', 'css']}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'elixir-editors/vim-elixir', {'for': ['elixir', 'eelixir']}
Plug 'gleam-lang/gleam.vim', {'for': 'gleam'}
Plug 'hellerve/carp-vim', {'for': 'carp'}
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'ts', 'typescriptreact', 'tsx']}
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
Plug 'peitalin/vim-jsx-typescript', {'for': ['typescriptreact', 'tsx']}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'ziglang/zig.vim', {'for': 'zig'}
call plug#end()

" Use true colors
set termguicolors

" Switch syntax highlighting on
syntax on

" Set default color scheme
set background=light
silent! colorscheme plain

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers
set number
set relativenumber

" Disable mouse click
set mouse=

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

" List used marks
nmap <leader>m :Marks<cr>

function! MarksList()
  let s:marks_names = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
  let s:marks_list = split(s:marks_names, '\zs')
  let localmarklist = map(copy(s:marks_list), '[v:val, line("''" . v:val)]')
  let usedmarks = join(map(localmarklist, '(v:val[1]>0 ? v:val[0] : "")'),'')
  return strlen(usedmarks) > 0?'  '.usedmarks.' ':''
endfunction

set statusline=%f\ %h%w%m%r%=
set statusline+=%{MarksList()}
set statusline+=%-14.(%l,%c%V%)\ %P

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

" Set cursor to block in visual, underline in replace or beam in insert mode
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

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


"""
""" LSP
"""
lua << EOF
local nvim_lsp = require'lspconfig'
--
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename(nil)<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>s', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)

end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
--
--local servers = { 'hls' }
local servers = { rust_analyzer }

require'lspconfig'.rust_analyzer.setup{ on_attach = on_attach }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end



EOF
