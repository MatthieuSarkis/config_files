" to refresh .vimrc after saving it 
autocmd! bufwritepost .vimrc source %

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'itchyny/lightline.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'morhetz/gruvbox'
Plugin 'preservim/nerdtree'
Plugin 'relastle/bluewery.vim'
Plugin 'arcticicestudio/nord-vim'

call vundle#end()            " required
filetype plugin indent on    " required

" to improve the backspace behavior
let g:SimpylFold_docstring_preview=1
set laststatus=2

" to setup the colow of the power bar
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" some basic configurations for the YouCompleteMe Plugin
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" youcompleteme config for c++"
let g:ycm_global_ycm_extra_conf = '/Users/matthieu.sarkis/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
set completeopt=menu

" make YCM compatible with UltiSnips (using <Ctrl-N>, <Ctrl-P>)
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" commands mappings
nnoremap <F1> :pclose<CR>:silent YcmCompleter GetDoc<CR>
nnoremap <S-F1> :pclose<CR>
nnoremap <C-F1> :YcmCompleter GetType<CR>
nnoremap <F9> :YcmCompleter GoTo<CR>
nnoremap <S-F9> :YcmCompleter GoToReferences<CR>
nnoremap <F10> :YcmCompleter FixIt<CR>

let g:ycm_use_clangd = 1

" turn-on python compatible highlighting
let python_highlight_all=1
syntax on

" setting up the color theme
"colorscheme gruvbox
"set background=dark
"colorscheme bluewery
"let g:lightline = { 'colorscheme': 'bluewery' }
colorscheme atlantis
"colorscheme nord

" to open and close the file tree
map <C-n> :NERDTreeToggle<CR>

" to enable the mouse and have the backspace working properly
set mouse=a
set bs=2

" improving a little bit the block tabulation
vnoremap < <gv
vnoremap > >gv

" a few basic settings: line numbering, etc...
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233
set nobackup
set nowritebackup
set noswapfile
set encoding=utf-8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
au BufNewFile,BufRead *.cpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
au BufNewFile,BufRead *.tex
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


" split navigations
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" to autoclose the brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" for VIM to detect whether we are in a virtual environment
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  exec(open(activate_this).read(), { "__file__": activate_this })
"EOF

