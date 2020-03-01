" Plugins
call plug#begin()
Plug 'dense-analysis/ale'
Plug 'cespare/vim-toml'
Plug 'dart-lang/dart-vim-plugin'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'andrewradev/splitjoin.vim'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'niklas-8/vim-darkspace'
call plug#end()

" Appearance
set number relativenumber
set cursorline
set termguicolors
set background=dark
colorscheme darkspace
let g:darkspace_italics = 1

" Tab settings
set tabstop=4
set shiftwidth=4
set noexpandtab
set list

" Window settings
set splitright
set splitbelow
autocmd FileType fugitive,help wincmd L

" Mouse settings
set mouse=a

" Case sensitivity
set ignorecase
set smartcase

" Hotkeys
let mapleader = "\<space>"
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>d :wq<cr>
nnoremap <leader>c <c-w>c
nnoremap <silent>gwh <c-w><c-h>
nnoremap <silent>gwj <c-w><c-j>
nnoremap <silent>gwk <c-w><c-k>
nnoremap <silent>gwl <c-w><c-l>
nnoremap <silent>gb :bn<cr>
nnoremap <silent>gB :bp<cr>
nmap <silent>gpj <c-d>
nmap <silent>gpk <c-u>
nmap <silent>gpn <c-f>
nmap <silent>gpN <c-b>
nnoremap <leader>e :e<space>
nnoremap <leader>s :sp<space>
nnoremap <leader>v :vs<space>
nnoremap <leader>t :tabnew<space>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>z :FZF<cr>
nnoremap <leader>y :Goyo<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gb :Gbrowse<cr>
nnoremap <leader>ge :Gedit %<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gl :Gpull<cr>
nnoremap <leader>gf :GitGutterFold<cr>
nmap <silent>ghN <Plug>(GitGutterPrevHunk)
nmap <silent>ghn <Plug>(GitGutterNextHunk)
nmap <silent>ghp <Plug>(GitGutterPreviewHunk)
nmap <silent>ghu <Plug>(GitGutterUndoHunk)
nmap <silent>ghs <Plug>(GitGutterStageHunk)
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)
nmap <leader>r <Plug>(ale_rename)
nmap <leader>f <Plug>(ale_fix)
nmap <silent>gd <Plug>(ale_go_to_definition)
nmap <silent>gy <Plug>(ale_go_to_type_definition)
nmap <silent>gr <Plug>(ale_find_references)
nmap <silent>gad <Plug>(ale_detail)
nmap <silent>gan <Plug>(ale_next_wrap)
nmap <silent>gaN <Plug>(ale_previous_wrap)
nmap <silent>K <Plug>(ale_hover)
imap <c-space> <Plug>(ale_complete)
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr><cr> pumvisible() ? "\<c-y>" : "\<cr>"

" Plug
let g:plug_window = "vertical new"

" Sneak plugin
let g:sneak#label = 1

" Goyo plugin
let g:goyo_width = 110
let g:goyo_height = "100%"
autocmd! User GoyoEnter set nocursorline
autocmd! User GoyoLeave set cursorline

" Startify plugin
let g:ascii = [
	\ '                               __',
	\ '  ___      __    ___   __  __ /\_\    ___ ___',
	\ '/'' _ `\  /''__`\ / __`\/\ \/\ \\/\ \ /'' __` __`\',
	\ '/\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \',
	\ '\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\',
	\ ' \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/',
	\ '',
	\ ]
let g:startify_custom_header = startify#pad(g:ascii + startify#fortune#boxed())
let g:startify_lists = [
	\ { 'type': 'files', 'header': startify#pad(['Recently used files']) },
	\ { 'type': 'bookmarks', 'header': startify#pad(['Bookmarks']) },
	\ { 'type': 'sessions', 'header': startify#pad(['Sessions']) },
	\ ]
let g:startify_bookmarks = [
	\ {'c': '.config/nvim/init.vim'},
	\ ]

" Ale plugin
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFuncset
set completeopt=menu,menuone,preview,noselect,noinsert
" let g:ale_virtualtext_cursor = 1
" let g:ale_cusor_detail = 1
let g:ale_linters = {
	\ 'rust': ['rls', 'cargo'],
	\ 'go': ['gopls', 'gofmt'],
	\ }
let g:ale_rust_cargo_use_clippy = 1
let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'rust': ['rustfmt'],
	\ 'go': ['gofmt', 'goimports'],
	\ }
let g:ale_completion_symbols = {
	\ 'text': '',
	\ 'method': '',
	\ 'function': '',
	\ 'constructor': '',
	\ 'field': '',
	\ 'variable': '',
	\ 'class': '',
	\ 'interface': '',
	\ 'module': '',
	\ 'property': '',
	\ 'unit': 'unit',
	\ 'value': 'val',
	\ 'enum': '',
	\ 'keyword': '',
	\ 'snippet': '',
	\ 'color': '',
	\ 'file': '',
	\ 'reference': 'ref',
	\ 'folder': '',
	\ 'enum member': '',
	\ 'constant': '',
	\ 'struct': '',
	\ 'event': 'event',
	\ 'operator': '',
	\ 'type_parameter': 'type-param',
	\ '<default>': 'v'
	\ }
