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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'vim-airline/vim-airline'
Plug 'niklas-8/vim-darkspace'
call plug#end()

" Appearance
set encoding=utf-8
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

" Enable mouse support
set mouse=a

" Hotkeys
let mapleader = "\<space>"
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>d :wq<cr>
nnoremap <leader>h <c-w><c-h>
nnoremap <leader>j <c-w><c-j>
nnoremap <leader>k <c-w><c-k>
nnoremap <leader>l <c-w><c-l>
nnoremap <leader>c <c-w>c
nnoremap <leader>i <c-b>
nnoremap <leader>u <c-f>
nnoremap <leader>e :e<space>
nnoremap <leader>s :sp<space>
nnoremap <leader>v :vs<space>
nnoremap <leader>t :tabnew<space>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>z :FZF<cr>
nnoremap <leader>ghp <Plug>(GitGutterPreviewHunk)
nnoremap <leader>ghu <Plug>(GitGutterUndoHunk)
nnoremap <leader>ghs <Plug>(GitGutterStageHunk)
nmap <leader>r <Plug>(coc-rename)
nmap <leader>f <Plug>(coc-format)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nnoremap <silent>K :call <sid>show_documentation()<cr>
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <tab>
	\ pumvisible() ? "\<c-n>" :
	\ <sid>check_back_space() ? "\<tab>" :
	\ coc#refresh()

" Airline plugin
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1

" Sneak plugin
let g:sneak#label = 1

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
