set nocompatible						" be iMproved, required

so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start					" Make backspaces behave normally
let mapleader = ','						" Set default leader to ,
set number							" Activate line numbers

set tabstop=8
set expandtab
set smarttab
set softtabstop=2
set shiftwidth=2

" Fast saves
cmap W w
cmap w!! w !sudo tee % > /dev/null
cmap bo cd ~/Code/buildout<cr>
nmap <leader>w :w!<cr>
nmap <leader>x :x<cr>
nmap <leader>xa :xa<cr>
" Reload file
nmap <leader><leader>e :e!<cr>





"------------ Visuals ---------------"

set background=dark
colorscheme solarized





"------------- Searching -------------"

" Highlight on search
set hlsearch
" Highlight as you type
set incsearch
" Ag/Silver Searcher
let g:ag_working_path_mode="r"





"------------- Splits -------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

let g:netrw_winsize=20





"------------- GUI Options -------------"
set guioptions-=T
set title
let &titleold=""

if has("gui_running")
  set macligatures
  set guifont=Fira\ Code:h15
endif





"------------- Mappings -------------"

" Make it easy to edit Vimrc file
nmap <Leader>ev :tabe $MYVIMRC<cr>
" Make it easy to edit plugins file
nmap <Leader>ep :tabe ~/.vim/plugins.vim<cr>
" Make it easy to edit snippet files
nmap <Leader>es :tabe ~/.vim/snippets/

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<cr>
nmap <Leader>g :Grepper -side -query "
nmap <Leader><C-r> :CtrlPTag<cr>
nmap <Leader>a :A<cr>

" Remove search highlight
nmap <Leader><space> :nohlsearch<cr>

" Toggle Sidebar
nmap <C-K><C-B> :Lex<cr>

" MERGE TOOL STUFF
if &diff
  nmap gn /====<CR>
  nmap gN ?====<CR>
  nmap gk V/>>>><CR>d?<<<<<CR>dd
  nmap gj V?<<<<<CR>d/>>>><CR>dd
endif





"------------ Plugins ---------------"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:30'

"/
"/ Powerline
"/
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
let g:Powerline_symbols = 'fancy'
set laststatus=2
set encoding=utf-8
set noshowmode





"----------- Auto-Commands ----------"

" Automatically source the Vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END
