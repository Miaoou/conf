if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'kana/vim-operator-user'
Plug 'Valloric/YouCompleteMe'
Plug 'mustache/vim-mustache-handlebars'
call plug#end()

colorscheme iceberg
set background=dark
let g:airline_theme='deus'
let g:airline_powerline_fonts=1

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

map <F12> <Esc>:YcmCompleter GoToDefinition<CR>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set encoding=utf-8

