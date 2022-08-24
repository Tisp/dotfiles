syntax on

set number
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set mouse=a
set shiftwidth=4
set smarttab

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'

call plug#end()

colorscheme dracula

map <C-b> :NERDTreeToggle<CR>
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 0 
let g:airline#extensions#branch#enabled = 1 
let g:airline_left_sep = '   '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = '' 
let g:airline_section_y = '' 
let g:airline_section_x = '' 
let g:airline#extensions#hunks#enabled = 1
set laststatus=2 " for airline
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open

let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-marketplace',
    \ 'coc-python',
    \ 'coc-sh',
    \ 'coc-spell-checker',
    \ 'coc-tsserver'
    \ ]
