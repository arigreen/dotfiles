"
" File:      init.vim
" Author:    <arigreenberg@gmail.com>
" Created:   2020-12-29
"
" Based off of https://github.com/jez/dotfiles/blob/master/vim/init.vim

" Define Plugins Here
call plug#begin('~/.config/nvim/plugged')
Plug 'arigreen/nord-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
call plug#end()

" General 'set xyz', 'command', and 'map' settings
source $HOME/.vim/settings.vim

" Everything else: plugin settings.
source $HOME/.vim/plug-settings.vim

" This needs to go after nord-specific variables are set
colorscheme nord

