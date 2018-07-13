call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'kana/vim-operator-user'
call plug#end()

colorscheme iceberg "https://github.com/cocopon/iceberg.vim
set background=dark
let g:airline_theme='deus'

set ruler
set nu
syntax on
set backspace=2

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

set directory=$HOME/.vim/swapfiles//

nnoremap <F4> <Esc>:NERDTreeToggle<CR> 

map <F2> <Esc>:tabprev<CR>
map <F3> <Esc>:tabnext<CR>
