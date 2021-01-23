" Settings
if (has('termguicolors'))
  set termguicolors
endif

" General
set title encoding=UTF-8 history=500 number updatetime=300
set mouse=a cursorline hid
set clipboard=unnamedplus                           " Replaced * with + for yanking
set autoread                                        " Reloads edited files done outside vim
set shortmess+=c
" set laststatus=0                                    " Disables status-line

" Tab configurations
set tabstop=4 softtabstop=4 shiftwidth=4
set expandtab autoindent

" Search
set hlsearch                                        " Highlight search results
set ignorecase                                      " Ignore case when searching
set smartcase                                       " Turn on smartcase
set incsearch                                       " Highlights all searches

" Indent
set list listchars=tab:│·

" Performance gain settings
set lazyredraw                                      " Prevents redraw while executing macros

" Leader
let g:mapleader = "\<Space>"

" Personal Mappings
nmap <leader>vp :PlugUpdate<CR>
nmap <leader>vg :PlugUpgrade<CR>
nmap <leader>re :so $MYVIMRC<CR>                    " Reload init.vim

" Faster save/close
nmap <leader>w :w<CR>
nmap <leader>x :x<CR>
nmap <leader>q :q<CR>

" Better Buffers
nnoremap <C-J> :bp<CR>
nnoremap <C-K> :bp<CR>
nnoremap <C-D> :bd<CR>
