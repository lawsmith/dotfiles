" NOTE: DEFAULT LEADER KEY IS '\'

" -------------------
" ENABLE PLUGINS
" -------------------
" Setup Vundle package manager
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'             " Shows the git branch in airline and adds some features
Plug 'shougo/unite.vim'               " Dependency for Vimfiler
Plug 'shougo/vimfiler.vim'
"Plug 'kien/ctrlp.vim' (trying out fzf for the meantime)
Plug 'airblade/vim-gitgutter'         " Adds git diff icons to the gutter
Plug 'raphamorim/lucario'             " Colorscheme
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }   " fzf plugin for (fuzzy file finder)

call plug#end()
filetype plugin indent on


" -----------------
" BASIC SETTINGS
" ----------------
colorscheme lucario                                             " Set the colour scheme
set background=dark
syntax enable
set hidden                                                      " Hides buffers
set nocompatible                                                " Eliminate backwards-compatability
set number                                                      " Enable line numbers
set ruler                                                       " Turn on the ruler
set backspace=2                                                 " Fixes some backspace issues
set t_Co=256                                                    " 256-bit colours
set guifont=Inconsolata\ for\ Powerline:h14                     " Set font to work with airline
set mouse=a                                                     " Enables the ability to use mouse
set ignorecase                                                  " Ignore case when searching
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab     " Use 4 Space characters for each indent
set nowrap
set list                                                        " Show trailing whitespace
set listchars=tab:▸\ ,trail:.
set clipboard=unnamed                                           " Enables use of system clipboard
set history=1000                                                " Remember more commands and search history
set undolevels=1000                                             " Remembers many levels of undo
set wildignore+=*.swp,*.bak,*.pyc,*.class
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor
set title
set incsearch
set lazyredraw
set ttyfast

" Key map settings
nnoremap <leader>f :VimFiler<CR>
" Disable the arrow keys to force me to use HJKL
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Make Copypasta work under maxOS and Tmux
map <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
vmap <F2> :w !pbcopy<CR><CR>


" -------------------
" PLUGIN CONFIGURATION
" -------------------
" ctrl-p Configuration (trying out fzf for the meantime)
"let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|vendor|public)|(\.(swp|ico|git|svn))$'
"let g:ctrlp_show_hidden = 1
"let g:ctrlp_working_path_mode = 'ra'

" NeoComplete Configuration
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Vimfiler Configuration
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', {'safe' : 0})    " disables safe mode so I can create files

" FZF Shortcut Configuration
nnoremap <leader>p :FZF<CR>
