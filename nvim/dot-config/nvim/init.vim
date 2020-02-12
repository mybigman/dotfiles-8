" Plugins
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/coc-flutter'
Plug 'josa42/coc-go'
Plug 'neoclide/coc-python'
Plug 'neoclide/coc-rls'
Plug 'cespare/vim-toml'
Plug 'dart-lang/dart-vim-plugin'
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
Plug 'vim-airline/vim-airline'
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
autocmd FileType fugitive,help wincmd L

" Mouse settings
set mouse=a

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
nnoremap <silent>gpj <c-f>
nnoremap <silent>gpk <c-b>
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
nmap <leader>r <Plug>(coc-rename)
nmap <leader>f <Plug>(coc-format)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nnoremap <silent>K :call <sid>show_documentation()<cr>
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" :
	\ <sid>check_back_space() ? "\<tab>" : coc#refresh()

" Plug
let g:plug_window = "vertical new"

" Airline plugin
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" Sneak plugin
let g:sneak#label = 1

" Goyo plugin
let g:goyo_width = 110
let g:goyo_height = "100%"
autocmd! User GoyoEnter set nocursorline
autocmd! User GoyoLeave set cursorline

" Coc plugin
set hidden
set updatetime=300
autocmd CursorHold * silent call CocActionAsync('highlight')
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
