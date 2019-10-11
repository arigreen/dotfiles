set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this lineset number

Plugin 'SirVer/ultisnips'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set encoding=utf-8
set guifont=Monaco:h12
colorscheme desert

if has('python3')
  silent! python3 1
endif

" if has('gui_running')
"     colorscheme bluegreen
" endif

" Visual appearance.
syntax on
set number
set nowrap
set fillchars+=vert:\ " Invisible vertical split line.
set lazyredraw " Make things faster.
"let loaded_matchparen = 1 " Turn off parenthesis matching.

" Status line.
set laststatus=2 " Always show status line.
set statusline=%F " Full path to file.
set statusline+=%(\ [%M%R]%) " Modified and readonly flags.
set statusline+=%= " Switch to right aligned.
set statusline+=%l/%L " Current line / total lines.

" Whitespace.
" Spaces instead of tabs.
set expandtab
" How many columns a tab counts for.
set tabstop=4
" How many columns vim uses when you hit Tab in insert mode.
set softtabstop=4
" How many columns of text is indented with <<, >>, and cindent.
set shiftwidth=4
set backspace=indent,eol,start
set smarttab
" Indentation
set autoindent
set cindent

" Highlight column 80.
set textwidth=80
set colorcolumn=0
"highlight ColorColumn ctermbg=246 guibg=#2d2d2d

" Search.
set incsearch
set ignorecase
set smartcase

" Switch buffers without saving.
set hidden

" Tab in command mode displays all completions.
set wildmenu
" Ignore filetypes in tab completion.
set wildignore+=*.aux,*.log,*.out,*.pdf

" Start scrolling 3 lines from border.
set scrolloff=3

" Matching brace
set showmatch

" Keep working dir clean
set directory=~/.tmp//,/tmp//,.
set backupdir=~/.tmp//,/tmp//,.

" Sudo
cmap w!! w !sudo tee % >/dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Saving shortcut
" nnoremap <C-W> :w <CR>

" Mapleader shortcuts
let mapleader="'"

" Create new split and switch to it.
nnoremap <Leader>w <C-w>v<C-w>l
nnoremap <Leader>s <C-w>s<C-w>j
" Close split
nnoremap <Leader>c <C-w>c

" Easier movement in split windows.
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Calls (saves first) make
nnoremap <Leader>m :w\|silent make\|redraw!\|cc<CR>

" Quick toggle of diff mode.
nnoremap <Leader>df :call DiffToggle()<CR>

function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    endif
:endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin 'gmarik/Vundle.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'ervandew/supertab'

Plugin 'godlygeek/tabular'
nnoremap <Leader>a :Tabularize /&<CR>
vnoremap <Leader>a :Tabularize /&<CR>

Plugin 'sjl/gundo.vim'
nnoremap <Leader>u :GundoToggle<CR>

Plugin 'plasticboy/vim-markdown'

Plugin 'derekwyatt/vim-scala'
Plugin 'flazz/vim-colorschemes'
Plugin 'JuliaLang/julia-vim'

Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'JamshedVesuna/vim-markdown-preview'

if has('gui_running')
    let g:UltiSnipsUsePythonVersion = 3
endif

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

set rtp+=~/.vim/bundle/vim-snippets/snippets/

call vundle#end()            " required
filetype plugin indent on    " required

call plug#begin('~/.vim/plugged')

Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on

" Recognize .tex files as latex (instead of plaintex) for syntax highlighting.
let g:tex_flavor="latex"

"autocmd FileType tex set autoindent
" Set the make program (rubber)
autocmd FileType tex set makeprg=rubber\ --inplace\ --maxerr\ 1\ \ --pdf\ --short\ --quiet\ --force\ %
" Mappings for compiling Latex file
autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>
"autocmd FileType tex nmap <buffer> <C-T> :!rubber --pdf --force --short %<CR>
autocmd FileType tex nmap <buffer> T :!open -a Skim %<.pdf %<.pdf<CR><CR>
autocmd FileType tex nmap <buffer> C :!rubber --clean<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove trailing whitespace on save.
autocmd BufWrite * :%s/\s\+$//e

" Turn off colorcolumn in diff mode.
autocmd FilterWritePre * if &diff | set cc= | endif

" Skeleton files
autocmd! BufNewFile * silent! 0r ~/.vim/skel/template.%:e

let g:syntastic_python_pyflakes_exe = 'python3 -m pyflakes'


" automatically open the quickfix window whenever you do :vimgrep or other commands that
" populate the quickfix/location list and there are qualified matches.
" https://stackoverflow.com/questions/43953589/chaining-vimgrep-and-copen-with-vim
augroup qf
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    cwindow
    autocmd VimEnter        *     cwindow
augroup END

" Favorite Shortcuts

" Remap jj to escape
inoremap jj <ESC>

" Disable the 'file changed' warning
set autoread
set backupdir=~/backup



filetype plugin on
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

Plug 'scrooloose/nerdtree'

" Duoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
