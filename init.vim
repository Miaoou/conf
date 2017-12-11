call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/Conque-GDB', { 'on':  'ConqueGdb' }
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
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
let g:ycm_extra_conf_globlist = ['/media/bgagnage/Data/wkp/*','!~/*']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

set directory=$HOME/.vim/swapfiles//

map <C-K> :pyf /home/bgagnage/local/share/clang/clang-format.py<CR>
imap <C-K> <c-o>:pyf /home/bgagnage/local/share/clang/clang-format.py<CR>

" disable autocompletion window
set completeopt=menu,menuone
nnoremap <F12> <Esc>:YcmCompleter GoTo<CR>

nnoremap <F4> <Esc>:NERDTreeToggle<CR> 

map <F2> <Esc>:tabprev<CR>
map <F3> <Esc>:tabnext<CR>
