call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()

colorscheme gruvbox
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set ruler
set nu
syntax on
set backspace=2

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

let g:ConqueGdb_SaveHistory = 1

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

set directory=$HOME/.vim/swapfiles//

" clang autocomplete
"let g:clang_use_library = 1
"let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang.so.1'

" disable autocompletion window
set completeopt=menu,menuone
nnoremap <F12> <Esc>:YcmCompleter GoTo<CR>

nnoremap <F4> <Esc>:NERDTreeToggle<CR> 

map <F2> <Esc>:tabprev<CR>
map <F3> <Esc>:tabnext<CR>
