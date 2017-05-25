set nocompatible              " be iMproved
filetype off


set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'klen/python-mode'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'majutsushi/tagbar'
Plugin 'google/yapf'
Plugin 'scrooloose/nerdtree'
Plugin 'rizzatti/dash.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'chriskempson/base16-vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'Yggdroot/indentLine'
Plugin 'rking/ag.vim'
"Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tweekmonster/impsort.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'kshenoy/vim-signature'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-rails'

call vundle#end()            " required

filetype plugin indent on     " required!

set t_Co=256

set background=dark

set hlsearch  " Hilight searches by default
set magic " Set magic on, for regular expressions
set wildmode=longest,full " Complete longest common string, then each full match
set wildmenu
set ignorecase
set smartcase
set history=100
set ff=unix
set encoding=utf-8
set fileencoding=utf-8
set autoread  " Automatically reread files that have been changed externally
set backspace=indent,eol,start
set hidden    " Switch buffers even if the current one have unsaved changes
set nu
set noswapfile
set expandtab
set clipboard=unnamed "Uses clipboard when you yank
set cpt-=t
set completeopt-=preview

"Change lead to comma
let mapleader=","

" Plugin Configuration
" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let g:Powerline_symbols='fancy'
let g:pymode_lint=1
let g:pymode_lint_cwindow=0
let g:pymode_lint_signs=1
let g:pymode_lint_message=1
let g:pymode_lint_on_write=1
let g:pymode_breakpoint=1
let g:pymode_breakpoint_cmd='import ipdb; ipdb.set_trace()'
let g:pymode_folding=1
let g:pymode_motion=1
let g:pymode_doc=0
let g:pymode_rope_completion=0
let g:pymode_rope=0
let g:pymode_options_max_line_length=210
let g:jedi#popup_on_dot=1
let g:pymode_lint_checkers=['pep8']

let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_virtualenv=1
let NERDTreeShowHidden=1


"Colors schemas
let g:base16colorspace=256
colorscheme base16-mocha
"colorscheme blackbeauty

"Ruby vim config
let g:ruby_indent_block_style = 'expression'
let g:ruby_indent_block_style = 'do'



" Auto save files when focus is lost
au FocusLost * silent! wa
set autowriteall

" Set a POSIX shell
set shell=zsh

autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e


nnoremap <leader>A :execute "Ag " . expand("<cword>")<CR>
nnoremap <leader>a :oldfiles<CR>


" Map Ctrl+<movement> to move around windows.
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" Favorite split window
map vv <c-w>v
map ss <c-w>s
map L ~

" For vimDiff
map ] ]c
map [ [c

nnoremap <leader>p Obinding.pry <ESC> :w <CR>
nnoremap gT :bp<CR>
nnoremap gt :bn<CR>
nnoremap H :b#<CR>

"do not expand time with esc

" Resize split
nnoremap <leader>h :vertical resize +15<cr>
nnoremap <leader>l :vertical resize -15<cr>
nnoremap <leader>j :resize +15<cr>
nnoremap <leader>k :resize -15<cr>

nnoremap <Leader>m :Explore<CR>
nnoremap <Leader>y :PymodeLintAuto<CR>
nnoremap <Leader>yr gg=G<CR>
nnoremap <Leader>c :nohlsearch<CR>
nnoremap <Leader>t :let g:pymode_python='python'<CR>
nnoremap <leader>is :<c-u>ImpSort!<cr>
nmap <silent> <leader><space> <Plug>DashSearch

inoremap jj <ESC> :w<CR>
inoremap kj <ESC>
nnoremap <leader>f :e $MYVIMRC<CR>
nnoremap <leader>ff :so $MYVIMRC<CR>

" My custom
nnoremap <c-j> <c-d>
nnoremap <space> w
nnoremap tt :bd<CR>

" Easy Usage
set pastetoggle=<leader>z

" Powerline setup
"set term=xterm-256color
set laststatus=2

" NERD Tree setup
" F2 to toggle the tree view
nnoremap <leader>m :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '^__pycache__$']

set wildignore+=*.o,*.pyc

" NERDCommenter
" For some reason, Vim sees Ctrl+/ as Ctrl+_
map <C-_> <plug>NERDCommenterToggle

" Tagbar setup
nnoremap <silent> <leader>o :TagbarToggle<CR>
let tagbar_left=0
let tagbar_autoclose=1
let tagbar_autofocus=1
let tagbar_sort=0

" vim-airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme= "base16_google"

highlight LineNr ctermfg=darkgrey ctermbg=None

" Syntatic
let g:syntastic_python_pylint_post_args='--disable C0301,C0111,C0103,F0401,I0011,R0201,R0801,R0902,R0903,R0904,R0913,R0914,E1002,E1101,E0611,W0142,W0212,W0232,W0401,unused-argument'

" CtrlP
let g:ctrlp_extensions=['tag', 'undo', 'line', 'changes', 'mixed']

syntax on
