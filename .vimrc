set nocompatible		" Dont try to be vi compatible
set nowrap
set encoding=utf8
filetype off			" Helps force plugins to load correctly when it is turned back on

let g:ale_completion_enabled = 1	" Needs to be decleared before ALE loads

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'gmarik/Vundle.vim'

 	" Plugin 'tmhedberg/SimpylFold'
 	" Plugin 'vim-scripts/indentpython.vim'
 	" Plugin 'Valloric/YouCompleteMe'
 	" Plugin 'vim-syntastic/syntastic'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
 	Plugin 'w0rp/ale'
 	Plugin 'nvie/vim-flake8'
 	Plugin 'jnurmine/Zenburn'
 	Plugin 'altercation/vim-colors-solarized'
 	Plugin 'scrooloose/nerdtree'
 	Plugin 'kien/ctrlp.vim'
 	Plugin 'tpope/vim-fugitive'
 	Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
	Plugin 'pangloss/vim-javascript'
 	Plugin 'mxw/vim-jsx'
 	Plugin 'mattn/emmet-vim'
    Plugin 'ryanoasis/vim-devicons'
call vundle#end()            " required

filetype plugin indent on	" For plugins to load correctly
syntax enable			" turn on syntax highlighting
set modelines=0			" Security
set number			" Show line numbers
set ruler			" Show file stats
set rulerformat=%l,%v
set visualbell			" Blink cursor on error instead of beeping (grr)
set encoding=utf-8		" Encoding
" set hidden			" Allow hidden buffers
set ttyfast             " Rendering
set laststatus=2		" Status bar
set background=dark
colorscheme solarized
colors zenburn
set tabstop=4			" Set proper tabs
set shiftwidth=4		" Set proper tabs
set smarttab			" Set proper tabs
set expandtab			" Set proper tabs


let g:airline#extensions#ale#enabled = 1	" Set this. Airline will handle the
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

let g:ale_fix_on_save = 1	" Set this variable to 1 to fix files when you save them.
let g:ale_linters = {
  			\ 'python': ['flake8'] ,
  			\ }
let g:ale_fixers = {
			\   '*': ['remove_trailing_lines', 'trim_whitespace'],
			\   'javascript': ['prettier', 'eslint'],
			\   'css': ['prettier'],
			\   'html': ['prettier'],
			\   'json': ['prettier'],
			\}
let g:user_emmet_settings = {
			\  'javascript.jsx' : {
			\      'extends': 'jsx',
			\      'quote_char': "'",
			\  },
			\}

"""""""""""""""""""""""""""""""""""""""""""""""""""""" KEYBINDINGS
" TODO: Pick a leader key
" let mapleader = ","
map <C-o> :NERDTreeToggle<CR>
call togglebg#map("<F5>")
nnoremap <F6> :buffers<CR>:buffer<Space>
"""""""""""""""""""""""""""""""""""""""""""""""""""""" KEYBINDINGS


"""""""""""""""""""""""""""""""""""""""""""""""""""""" AUTOCOMMANDS
" Open NERDTree when no file is specified on open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeQuitOnOpen = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""" AUTOCOMMANDS



"""""""""""""""""""""""""""""""""""""""""""""""""""""" VIRTUALENV support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""" VIRTUALENV support


"""""""""""""""""""""""""""""""""""""""""""""""""""""" FOLDING
set foldmethod=indent "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened
"""""""""""""""""""""""""""""""""""""""""""""""""""""" FOLDING
