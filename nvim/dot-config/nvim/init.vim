" Plugins
packadd minstat
packadd mincol
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
call minpac#add("tpope/vim-repeat")
call minpac#add("justinmk/vim-sneak")
call minpac#add("junegunn/fzf")
call minpac#add("junegunn/fzf.vim")
call minpac#add("tpope/vim-obsession")
call minpac#add("justinmk/vim-dirvish")
call minpac#add("junegunn/goyo.vim")
command! PackUpdate source $MYVIMRC | call minpac#update()
command! PackClean source $MYVIMRC | call minpac#clean()
command! PackStatus source $MYVIMRC | call minpac#status()

" Appearance
set number relativenumber
set cursorline
set list
set termguicolors
colorscheme mincol

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
filetype plugin indent on

" Window settings
set splitright splitbelow
autocmd FileType fugitive,minpac,help wincmd L

" Miscellaneous
set mouse=a
set updatetime=100
set ignorecase smartcase

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
nnoremap <silent>gpp <c-b>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>e :wq<cr>
nnoremap <leader>c <c-w>c
nnoremap <leader>ze :Files<cr>
nnoremap <leader>zl :Lines<cr>
nnoremap <leader>zt :tabnew\|:Files<cr>
nnoremap <leader>d :Dirvish %<cr>
nnoremap <leader>y :Goyo<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiffsplit<cr>
nnoremap <leader>gb :Gbrowse<cr>
nnoremap <leader>gps :Gpush<cr>
nnoremap <leader>gpl :Gpull<cr>
nnoremap <leader>gf :GitGutterFold<cr>
nmap <silent>ghj <plug>(GitGutterNextHunk)
nmap <silent>ghk <plug>(GitGutterPrevHunk)
nmap <silent>ghp <plug>(GitGutterPreviewHunk)
nmap <silent>ghu <plug>(GitGutterUndoHunk)
nmap <silent>ghs <plug>(GitGutterStageHunk)
omap ih <plug>(GitGutterTextObjectInnerPending)
omap ah <plug>(GitGutterTextObjectOuterPending)
xmap ih <plug>(GitGutterTextObjectInnerVisual)
xmap ah <plug>(GitGutterTextObjectOuterVisual)
nmap <leader>lr <plug>(ale_rename)
nmap <leader>lf <plug>(ale_fix)
nmap <leader>ld <plug>(ale_detail)
nmap <leader>lh <plug>(ale_hover)
nmap <silent>glj <plug>(ale_next_wrap)
nmap <silent>glk <plug>(ale_previous_wrap)
nmap <silent>gld <plug>(ale_go_to_definition)
nmap <silent>glt <plug>(ale_go_to_type_definition)
nmap <silent>glf <plug>(ale_find_references)
imap <c-space> <plug>(ale_complete)
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr><cr> pumvisible() ? "\<c-y>" : "\<cr>"

" Dirvish plugin
let g:dirvish_mode = ':sort ,^.*[\/],'
autocmd VimEnter * silent! au! FileExplorer *
autocmd FileType dirvish nmap <silent><buffer>h <plug>(dirvish_up)
autocmd FileType dirvish nmap <silent><buffer>l <cr>
autocmd FileType dirvish nmap <silent><buffer>v V

" Sneak plugin
let g:sneak#label = 1
let g:sneak#s_next = 1

" Fzf plugin
let g:fzf_layout = { "down": "10" }
let g:fzf_colors = {
	\ "bg+": ["bg", "Visual"],
	\ "hl": ["fg", "Directory"],
	\ "hl+": ["fg", "Directory"],
	\ "prompt": ["fg", "Directory"],
	\ }

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
