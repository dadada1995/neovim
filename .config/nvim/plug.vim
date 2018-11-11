"==========================================
" Pluging setting
"==========================================
call plug#begin('~/.config/nvim/autoload')

"Asynchronous Lint Engine
Plug 'w0rp/ale'
      let g:ale_linters = {
      \   'c': ['clang'],
      \   'c++': ['clang'],
      \}
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <Leader>ep <Plug>(ale_previous_wrap)
nmap <silent> <Leader>en <Plug>(ale_next_wrap)


"automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

"snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"fast comment
Plug 'scrooloose/nerdcommenter'

"easy align
Plug 'junegunn/vim-easy-align'

"display marks
Plug 'kshenoy/vim-signature'
"location files, tags, etc.
Plug 'Yggdroot/LeaderF'
nmap <leader>F :LeaderfFunction<CR>

"directory tree
Plug 'scrooloose/nerdtree'
map <F1> :NERDTreeToggle<CR>

"tag list
Plug 'majutsushi/tagbar'
map <F9> :TagbarToggle<CR>

" quickrun
Plug 'thinca/vim-quickrun'

" show git diff
Plug 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 1
set updatetime=100

"Git wrapper
Plug 'tpope/vim-fugitive'

"beautiful
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'
Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
			\ ['brown',       'RoyalBlue3'],
			\ ['Darkblue',    'SeaGreen3'],
			\ ['darkgray',    'DarkOrchid3'],
			\ ['darkgreen',   'firebrick3'],
			\ ['darkcyan',    'RoyalBlue3'],
			\ ['darkred',     'SeaGreen3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['brown',       'firebrick3'],
			\ ['gray',        'RoyalBlue3'],
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'
Plug 'liuchengxu/space-vim-dark'
set background=dark
"colorscheme solarized
colorscheme space-vim-dark
hi Comment cterm=italic
syntax enable

"workspace
Plug 'vim-ctrlspace/vim-ctrlspace'
set hidden
nnoremap <silent><C-space> :CtrlSpace<CR>

"word search
Plug 'rking/ag.vim'

"trim whitespace
Plug 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

"automatic completion
Plug 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion = ['<c-j>', 'J']
let g:ycm_key_list_previous_completion = ['<c-k>', 'K']
"nnoremap <leader>gf :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
let g:ycm_use_ultisnips_completer = 0 "提示UltiSnips
let g:ycm_global_ycm_extra_conf = "~/.config/nvim/autoload/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"

"tags
Plug 'lyuts/vim-rtags'

"language server protocol c/s
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_settingsPath = expand('~/.config/languageclient.json')
let g:LanguageClient_selectionUI = 'quickfix'
let g:LanguageClient_diagnosticsList = v:null
"let g:LanguageClient_hoverPreview = 'Never'
let g:LanguageClient_serverCommands = {}
let g:LanguageClient_serverCommands.cpp = ['/root/.config/nvim/cquery/build/release/bin/cquery',
            \'--log-file=/tmp/log', '--init={"cacheDirectory":"/var/cquery/"}']

noremap gd :call LanguageClient#textDocument_definition()<cr>
noremap gr :call LanguageClient#textDocument_references()<cr>
noremap gh :call LanguageClient#textDocument_hover()<cr>

call plug#end()
