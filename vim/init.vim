"
" File:      init.vim
" Author:    <arigreenberg@gmail.com>
" Created:   2020-12-29
"
" Based off of https://github.com/jez/dotfiles/blob/master/vim/init.vim

" Define Plugins Here
call plug#begin('~/.config/nvim/plugged')
Plug 'arigreen/nord-vim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
"Plug 'autozimu/LanguageClient-neovim', {
"      \ 'branch': 'next',
"      \ 'do': 'bash install.sh',
"      \ }
" Plug 'jez/vim-sorbet'

Plug 'neoclide/coc.nvim', {'do': 'yarn install'}

Plug 'fatih/vim-go'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'antoinemadec/coc-fzf'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" General 'set xyz', 'command', and 'map' settings
source $HOME/.vim/settings.vim

" # lua require'lspconfig'.sorbet.setup{
" #       \ cmd = {"pay", "exec", "scripts/bin/typecheck", "--lsp",  "--enable-all-experimental-lsp-features"};
" #       \ filetypes = {"ruby"};
" #       \ onattach = require'completion'.on_attach
" #       \ };
" # 
" Everything else: plugin settings.
source $HOME/.vim/plug-settings.vim

" Stripe-specific plugin settings
source $HOME/.stripe/vim/plug-settings.vim

" This needs to go after nord-specific variables are set
colorscheme nord

"let g:deoplete#enable_at_startup = 1
"
"

" Use tab and shift+tab to navigate forward/back on completion list and
" snippets
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
let g:coc_snippet_next = '<tab>'

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" make <cr> select the first completion item and confirm completion when no
" items have selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

function! g:CocShowDocumentation()
  " supports jumping to vim documentation as well using built-ins.
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

nmap <silent> gh :call CocShowDocumentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

let g:coc_user_config = {}
"let g:coc_user_config['coc.preferences.jumpCommand'] = ':vsp'

" allow to scroll in the preview
set mouse=a

" mappings
nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>
nnoremap <silent> <space>a       :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <space>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <space>c       :<C-u>CocFzfList commands<CR>
nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <space>l       :<C-u>CocFzfList location<CR>
nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>s       :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:coc_fzf_preview='right:50%'

let g:ale_linters['ruby'] = ['rubocop']

autocmd! BufEnter,BufNewFile *.md colorscheme morning 
autocmd! BufLeave  *.md colo nord


" augroup stripe_projectionist
"   autocmd!
"  autocmd BufEnter *.rb call s:(expand("<afile>:p"))
augroup END

" function! s:find_test_directory(path)
"   let l:directory = fnamemodify(a:path, ":p:h")
"   let l:relative_dr = substitute(l:directory, getcwd() . "/*", "", "")
"   let l:pieces = split(l:relative_dir, "/")
" 
"   while len(l:pieces) > 0
"     let l:current_dir = join(l:pieces, "/")
"     let l:possible_test_dir = l:current_dir . "/test"
" 
"     if isdirectory(l:possible_test_dir)
"       " found the test dir
"       return { 'root': l:current_dir, 'test_dir': l:possible_test_dir }
"     endif
" 
"     call remove(l:pieces, -1)
"   endwhile
" 
"   return {}
" endfunction
" 
" function! s:config_alternates_pay_server(buffer_path)
"   if a:buffer_path =~ "stripe/pay-server"
"     if empty(get(b:, 'stripe_projectionist_registered_files'))
"       let b:stripe_projectionist_registered_files = {}
"     endif
" 
"     if get(b:stripe_projectionist_registered_files, a:buffer_path)
"       " we already did a recursive search in this buffer, let's not do it
"       " again
"       return
"     endif
" 
"     if empty(get(b:, 'projectionist'))
"       let b:projectionist = getbufvar('#', 'projectionist')
"     endif
" 
"     let l:search = s:find_test_directory(a:buffer_path)
" 
"     " mark that we've already done the expensive search
"     let b:stripe_projectionist_registered_files[a:buffer_path] = 1
" 
"     if l:search == {}
"       return
"     endif
" 
"     let l:projections = {}
"     let l:projections[l:search['root'] . "/*"] =
"       \ {
"       \   'alternate': l:search['test_dir'] . "/{}",
"       \ }
" 
"     let l:projections[l:search['test_dir'] . "/*"] =
"       \ {
"       \   'alternate': l:search['root'] . "/{}",
"       \ }
" 
"     call projectionist#append(getcwd(), l:projections)
"   endif
" endfunction
