" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='nord'

"  ALE
Plug 'w0rp/ale'

call ale#linter#Define('ruby', {
\   'name': 'sorbet-payserver',
\   'lsp': 'stdio',
\   'executable': 'true',
\   'command': 'pay exec scripts/bin/typecheck --lsp',
\   'language': 'ruby',
\   'project_root': $HOME . '/stripe/pay-server',
\})

if !exists("g:ale_linters")
    let g:ale_linters = {}
endif

if !exists("g:ale_fixers")
    let g:ale_fixers = {}
endif

let g:ale_fixers['ruby'] = ['sorbet']

if fnamemodify(getcwd(), ':p') =~ $HOME.'/stripe/pay-server'
  let g:ale_linters['ruby'] = ['sorbet-payserver']
else
  let g:ale_linters['ruby'] = ['sorbet']
end

" Bind <leader>d to go-to-definition.
nmap <silent> <leader>d <Plug>(ale_go_to_definition)

let g:ale_command_wrapper = $HOME . '/dotfiles/ale/ale_wrap.sh'

" Nord
let g:nord_italic=1
let g:nord_italic_comments=1
