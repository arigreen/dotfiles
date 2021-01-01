set termguicolors
set background=dark


" Navigate tabs
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <leader>t :tabnew<CR>

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>

" no number in terminal
autocmd TermOpen * setlocal nonumber

" clear highlight when starting a new one
nnoremap / :noh<CR>/
" map 0 to the first char of the line
map 0 ^
" copy filename into clipboard
nnoremap <silent> <leader>yf :let @+=expand("%")<CR>

set clipboard+=unnamedplus  " Copy and paste outside
set number                  " Show line numbers
set expandtab               " Insert spaces when TAB is pressed
set tabstop=2               " Render TABs using this many spaces
set shiftwidth=2            " Indentation amount
set lbr                     " when wrapping, dont break the word in half
set scrolloff=7             " minimal number of screen lines to keep above/below cursor
set ignorecase              " search case is ignored
set smartcase               " dont ignore case if there are capitals
set nocursorline            " do not highlight the screen line of the cursor (perf. issues)
set noswapfile              " no swap file to recover
set updatetime=200          " update faster for things like gitgutter
set cc=80                   " colour column hint at 80 width

" NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>m :NERDTree %<CR>
" Show hidden files
let NERDTreeShowHidden=1
" quit vim if nerdtree is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

