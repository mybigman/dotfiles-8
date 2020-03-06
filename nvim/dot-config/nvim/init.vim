" Plugins
packadd minpac
call minpac#init()
call minpac#add("dense-analysis/ale")
call minpac#add("cespare/vim-toml")
call minpac#add("airblade/vim-gitgutter")
call minpac#add("tpope/vim-fugitive")
call minpac#add("tpope/vim-rhubarb")
call minpac#add("andrewradev/splitjoin.vim")
call minpac#add("tpope/vim-commentary")
call minpac#add("tpope/vim-surround")
call minpac#add("justinmk/vim-sneak")
call minpac#add("tpope/vim-repeat")
call minpac#add("cloudhead/neovim-fuzzy")
call minpac#add("romainl/vim-tinyMRU")
call minpac#add("tpope/vim-obsession")
call minpac#add("justinmk/vim-dirvish")
call minpac#add("junegunn/goyo.vim")
command! PackUpdate source $MYVIMRC | call minpac#update()
command! PackClean source $MYVIMRC | call minpac#clean()
command! PackStatus source $MYVIMRC | call minpac#status()

" Appearance
set number relativenumber
set cursorline
set termguicolors
colorscheme mincol

" Tab settings
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
set tabstop=4
set shiftwidth=4
set noexpandtab
set list

" Window settings
set splitright
set splitbelow
autocmd FileType fugitive,minpac,help wincmd L

" Miscellaneous
set mouse=a
set updatetime=100
set ignorecase
set smartcase

" Hotkeys
let mapleader = "\<space>"
nnoremap <silent>gwh <c-w><c-h>
nnoremap <silent>gwj <c-w><c-j>
nnoremap <silent>gwk <c-w><c-k>
nnoremap <silent>gwl <c-w><c-l>
nnoremap <silent>gb :bn<cr>
nnoremap <silent>gB :bp<cr>
nnoremap <silent>gpj <c-d>
nnoremap <silent>gpk <c-u>
nnoremap <silent>gpn <c-f>
nnoremap <silent>gpN <c-b>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>e :wq<cr>
nnoremap <leader>c <c-w>c
nnoremap <leader>ft :tabnew\|:FuzzyOpen<cr>
nnoremap <leader>fe :FuzzyOpen<cr>
nnoremap <leader>fg :FuzzyGrep<cr>
nnoremap <leader>d :Dirvish %<cr>
nnoremap <leader>y :Goyo<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gb :Gbrowse<cr>
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
nmap <leader>ar <Plug>(ale_rename)
nmap <leader>af <Plug>(ale_fix)
nmap <silent>gd <Plug>(ale_go_to_definition)
nmap <silent>gy <Plug>(ale_go_to_type_definition)
nmap <silent>gr <Plug>(ale_find_references)
nmap <silent>gad <Plug>(ale_detail)
nmap <silent>gan <Plug>(ale_next_wrap)
nmap <silent>gaN <Plug>(ale_previous_wrap)
nmap <silent>gah <Plug>(ale_hover)
imap <c-space> <Plug>(ale_complete)
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr><cr> pumvisible() ? "\<c-y>" : "\<cr>"

" Dirvish plugin
let g:dirvish_mode = ':sort ,^.*[\/],'
autocmd VimEnter * silent! au! FileExplorer *
autocmd FileType dirvish nmap <silent><buffer>h <Plug>(dirvish_up)
autocmd FileType dirvish nmap <silent><buffer>l <cr>
autocmd FileType dirvish nmap <silent><buffer>v V

" Sneak plugin
let g:sneak#label = 1
let g:sneak#s_next = 1

" Goyo plugin
let g:goyo_width = 110
let g:goyo_height = "100%"
autocmd! User GoyoEnter set nocursorline
autocmd! User GoyoLeave set cursorline

" Ale plugin
let g:ale_linters = {
	\ 'rust': ['rls'],
	\ }
let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'rust': ['rustfmt'],
	\ }
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
set completeopt=menu,menuone,preview,noselect,noinsert
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
