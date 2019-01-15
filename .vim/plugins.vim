filetype off							" required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'tpope/vim-vinegar'
Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
"Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'skalnik/vim-vroom'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
Plugin 'mhinz/vim-grepper'
Plugin 'MarcWeber/vim-addon-local-vimrc'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'altercation/vim-colors-solarized'





call vundle#end()						" required
filetype plugin indent on					" required
