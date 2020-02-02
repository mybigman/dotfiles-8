" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'rust-lang/rust.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
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
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <silent>gd <Plug>(coc-definition)
nnoremap <silent>gy <Plug>(coc-type-definition)
nnoremap <silent>gi <Plug>(coc-implementation)
nnoremap <silent>gr <Plug>(coc-references)
xnoremap <leader>f <Plug>(coc-format-selected)
nnoremap <leader>f <Plug>(coc-format-selected)
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <tab>
	\ pumvisible() ? "\<c-n>" :
	\ <SID>check_back_space() ? "\<tab>" :
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
