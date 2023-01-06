" map leader to comma
let mapleader = ","

" Setup side panel
"let g:netrw_liststyle = 3
"let g:netrw_banner = 0
"let g:netrw_browse_split = 0
"let g:netrw_winsize = 20
"let g:netrw_keepdir = 0
"let g:netrw_localcopydircmd = 'cp -r'

" Assign toggle for side panel
nnoremap <leader>f :Explore<CR>

" Use ALT-[hjkl] to select the active split! Colmak-modded
nmap <silent> <leader>i :wincmd k<CR>
nmap <silent> <leader>e :wincmd j<CR>
nmap <silent> <leader>n :wincmd h<CR>
nmap <silent> <leader>o :wincmd l<CR>

" Set Compatibility 
set nocompatible

" Enable text Wrapping
"set wrap

" Set Vim update time
set updatetime=100

" Status Bar
set laststatus=2

" faster scrolling
set ttyfast

" Set tab spacing
set tabstop=4

" automatically indent new lines
"set autoindent

" replace tabs with spaces automatically
"set expandtab

" Set Line Number
set number relativenumber

" Shortcuts to Toggle or add functionality
map <leader>l :set number! relativenumber!<CR>

" Import .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

