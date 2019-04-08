set nocompatible		            " Dont try to be vi compatible
set nowrap
set encoding=utf8
filetype off			            " Helps force plugins to load correctly when it is turned back on

let g:ale_completion_enabled = 1	" Needs to be decleared before ALE loads

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'gmarik/Vundle.vim'

    " File navigation
 	Plugin 'scrooloose/nerdtree'

    " Git integration
 	Plugin 'tpope/vim-fugitive'
    "Plugin 'airblade/vim-gitgutter'

    " Linting
 	Plugin 'w0rp/ale'
    Plugin 'neomake/neomake'
 	Plugin 'nvie/vim-flake8'
	Plugin 'pangloss/vim-javascript'
 	Plugin 'mxw/vim-jsx'

    " Autocompletion
    Plugin 'roxma/nvim-yarp'
    Plugin 'ncm2/ncm2'
    Plugin 'HansPinckaers/ncm2-jedi'
    Plugin 'ncm2/ncm2-bufword'
    Plugin 'ncm2/ncm2-path'

    " Comments
    Plugin 'tpope/vim-commentary'

    " Themes
 	Plugin 'altercation/vim-colors-solarized'
	Plugin 'vim-airline/vim-airline-themes'
    Plugin 'jnurmine/Zenburn'

    " Status bar
	Plugin 'vim-airline/vim-airline'

    " Search
 	Plugin 'kien/ctrlp.vim'


 	" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    
    " Additional plugins
 	Plugin 'mattn/emmet-vim'
    Plugin 'ryanoasis/vim-devicons'

call vundle#end()            " required


filetype plugin indent on	        " For plugins to load correctly
syntax enable			            " turn on syntax highlighting
set modelines=0			            " Security
set number			                " Show line numbers
set ruler			                " Show file stats
set rulerformat=%l,%v
set visualbell			            " Blink cursor on error instead of beeping (grr)
set encoding=utf-8		            " Encoding
" set hidden			            " Allow hidden buffers
set ttyfast                         " Rendering
set laststatus=2		            " Status bar
set background=dark
colorscheme solarized
colors zenburn
set tabstop=4			            " Set proper tabs
set shiftwidth=4		            " Set proper tabs
set smarttab			            " Set proper tabs
set expandtab			            " Set proper tabs


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

"""""""""""""""""""""""""""""""""""""""""""""""""""""" NCM2 Settings
" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'
"""""""""""""""""""""""""""""""""""""""""""""""""""""" NCM2 Settings


"""""""""""""""""""""""""""""""""""""""""""""""""""""" JEDI-VIM 
" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
"""""""""""""""""""""""""""""""""""""""""""""""""""""" JEDI-VIM 


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
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
 " activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
 " execfile(activate_this, dict(__file__=activate_this))
"EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""" VIRTUALENV support


"""""""""""""""""""""""""""""""""""""""""""""""""""""" FOLDING
set foldmethod=indent "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened
"""""""""""""""""""""""""""""""""""""""""""""""""""""" FOLDING

" Neomake config
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)

let g:python3_host_prog= '/usr/bin/python/'
