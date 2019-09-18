set nocompatible						" be iMproved, required

so ~/.vim/plugins.vim

set rtp+=/usr/local/bin/fzf

syntax enable
set synmaxcol=225

set backspace=indent,eol,start					" Make backspaces behave normally
nnoremap <Space> <Nop>
let mapleader = ' '					        " Set default leader to space
set number							" Activate line numbers

set tabstop=8
set expandtab
set smarttab
set softtabstop=2
set shiftwidth=2

" Fast saves
cmap W w
cmap w!! w !sudo tee % > /dev/null
nmap <leader>w :w!<cr>
nmap <leader>x :x<cr>
nmap <leader>xa :xa<cr>
" Reload file
nmap <leader><leader>e :e!<cr>
nmap <leader><leader>c :%bd\|e#<cr>





"------------ Visuals ---------------"

set background=dark
colorscheme solarized
set colorcolumn=120





"------------- Searching -------------"
nmap [a :cprevious<CR>
nmap ]a :cnext<CR>
" Highlight on search
set hlsearch
" Highlight as you type
set incsearch
" Ag/Silver Searcher
let g:ag_working_path_mode="r"

" fzf
nnoremap <Leader>p :FZF<cr>

" grepper
let g:grepper = {}
let g:grepper.simple_prompt = 1
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
nmap <leader>G :Grepper -cword -noprompt<CR>
nmap <leader>g :GrepperAg 





"------------- Splits -------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

" let g:netrw_winsize=20
let g:netrw_altfile=1





"------------- GUI Options -------------"
set guioptions-=T
set title
let &titleold=""

if has("gui_running")
  set macligatures
  set guifont=Fira\ Code:h15
endif





"------------- Mappings -------------"

" New Mac's esc key sucks
imap jj <Esc>
" Make it easy to edit Vimrc file
nmap <Leader>ev :tabe $MYVIMRC<cr>
" Make it easy to edit plugins file
nmap <Leader>ep :tabe ~/.vim/plugins.vim<cr>
" Make it easy to edit snippet files
nmap <Leader>es :tabe ~/.vim/snippets/
" Make it easy to edit todo file
nmap <Leader><Leader>t :tabe ~/todo.md<cr>

map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<cr>
nmap <Leader>a :A<cr>

" Remove search highlight
nmap <Leader><Space> :nohlsearch<cr>

" Toggle Sidebar
nmap <C-K><C-B> :Lex<cr>

" vim-rspec
map <Leader>t :call RunCurrentSpecFile()<cr>
map <Leader>s :call RunNearestSpec()<cr>
map <Leader>l :call RunLastSpec()<cr>

" MERGE TOOL STUFF
if &diff
  nmap gn /====<CR>
  nmap gN ?====<CR>
  nmap gk V/>>>><CR>d?<<<<<CR>dd
  nmap gj V?<<<<<CR>d/>>>><CR>dd
endif

"------------ Cursors ---------------"
" Changes cursor shape based on mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"


nmap <leader>x :call ExtractVariable()<cr>
" Assigns the last removed text to a variable named to the last added text
func! ExtractVariable()
  if &filetype == "ruby"
    call feedkeys("O. = \"")
  endif
endfunc




"------------ Plugins ---------------"
"/
"/ Powerline
"/
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
let g:Powerline_symbols = 'fancy'
set laststatus=2
set encoding=utf-8
set noshowmode

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'ruby': ['rubocop', 'ruby']
\ }

let g:rails_projections = {
\ 'app/*.rb': { 'alternate': 'spec/{}_spec.rb' },
\ 'lib/*.rb': { 'alternate': 'spec/{}_spec.rb' },
\ 'spec/*_spec.rb': { 'alternate': 'app/{}.rb' },
\
\ 'app/javascript/*.js': { 'alternate': 'spec/javascript/{}.test.js' },
\ 'spec/javascript/*.test.js': { 'alternate': 'app/javascript/{}.js' }
\ }

" vim-rspec
let g:rspec_command = 'call Send_to_Tmux("clear; rspec {spec}\n")'

" vim-commentary
" autocmd FileType markdown setlocal commentstring='<!-- %s -->'

" dash
nmap <leader>d :Dash<cr>
let g:dash_activate = 0





"----------- Auto-Commands ----------"

" Automatically source the Vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
    autocmd BufWritePost plugins.vim source ~/.vimrc
augroup END
