" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='nord'

"  ALE
Plug 'w0rp/ale'

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '▲'

let g:ale_linters = {}
let g:ale_fixers = {}

let g:ale_linters['ruby'] = ['rubocop', 'sorbet']

" let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_rubocop_executable = '/Users/arigreen/scripts/my_rubocop'

" Bind <leader>d to go-to-definition.
nmap <silent> <leader>d <Plug>(ale_go_to_definition)

" let g:ale_command_wrapper = $HOME . '/dotfiles/ale/ale_wrap.sh'

" LanguageClient-neovim
let s:script_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

"let g:LanguageClient_serverCommands = {
"    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"    \ }
let g:LanguageClient_diagnosticsDisplay = {
      \     1: {
      \         "name": "Error",
      \         "texthl": "SpellBad",
      \         "signText": "●",
      \         "signTexthl": "LCHighlightedError",
      \         "virtualTexthl": "LCHighlightedError",
      \     },
      \     2: {
      \         "name": "Warning",
      \         "texthl": "SpellBad",
      \         "signText": "▲",
      \         "signTexthl": "LCHighlightedWarn",
      \         "virtualTexthl": "LCHighlightedWarn",
      \     },
      \     3: {
      \         "name": "Information",
      \         "texthl": "SpellBad",
      \         "signText": "ℹ",
      \         "signTexthl": "LCHighlightedInfo",
      \         "virtualTexthl": "LCHighlightedInfo",
      \     },
      \     4: {
      \         "name": "Hint",
      \         "texthl": "ALEWarning",
      \         "signText": "➤",
      \         "signTexthl": "Todo",
      \     },
      \ }
let g:LanguageClient_documentHighlightDisplay = {
      \     1: {
      \         "name": "Text",
      \         "texthl": "Search",
      \     },
      \     2: {
      \         "name": "Read",
      \         "texthl": "Search",
      \     },
      \     3: {
      \         "name": "Write",
      \         "texthl": "Search",
      \     },
      \ }
let g:LanguageClient_loggingLevel = 'INFO' " Use highest logging level
let g:LanguageClient_loggingFile = '/tmp/languageclient-neovim.log'
let g:LanguageClient_serverCommands = {}

function! JezLanguageClientRestart() abort
  LanguageClientStop
  LanguageClientStart
endfunction

" augroup jezLanguageClient
"   au!
"   au FileType ruby,rust,c,cpp nnoremap <silent> <buffer> <leader>cm :call LanguageClient_contextMenu()<CR>
"   au FileType ruby,rust,c,cpp nnoremap <silent> <buffer> gd :call LanguageClient#textDocument_definition()<CR>
"   au FileType ruby,rust,c,cpp nnoremap <silent> <buffer> <leader>t :call LanguageClient#textDocument_hover()<CR>
"   au FileType ruby,rust,c,cpp nnoremap <silent> <buffer> K :call LanguageClient#explainErrorAtPoint()<CR>
"   au FileType ruby,rust,c,cpp nnoremap <silent> <buffer> gy :call LanguageClient#textDocument_typeDefinition()<CR>
"   au FileType ruby,rust,c,cpp nnoremap <silent> <buffer> <leader>ir :call LanguageClient#textDocument_references()<CR>
"   au FileType ruby,rust,c,cpp nnoremap <silent> <buffer> <leader>. :call LanguageClient#textDocument_codeAction()<CR>
"   au FileType ruby,rust,c,cpp inoremap <silent> <buffer> <C-g><C-p> <C-x><C-o>
" 
"   au FileType ruby,rust,c,cpp nnoremap <silent> <buffer> <leader>ik :call JezLanguageClientRestart()<CR>
" 
"   au FileType ruby let g:LanguageClient_echoProjectRoot = 0
"   " Can merge this with settings.json in vim-sorbet after this lands:
"   " https://github.com/autozimu/LanguageClient-neovim/pull/1112
"   au FileType ruby let g:LanguageClient_settingsPath = [s:script_dir.'/settings.json', '.vim/settings.json']
" augroup END
" }}}
" ----- jez/vim-sorbet ----- {{{
if fnamemodify(getcwd(), ':p') !~# $HOME.'/stripe/pay-server'
  let g:sorbet_lsp_extra_args = ['--debug-log-file=/tmp/sorbet-nvim.log']
endif

let g:LanguageClient_autoStart=1
let g:LanguageClient_devel=1
let g:LanguageClient_loggingLevel='DEBUG'

" Nord
let g:nord_italic=1
let g:nord_italic_comments=1

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

