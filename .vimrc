" map leader to comma
let mapleader = ","

" Setup side panel
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_winsize = 20
let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'

" open files from netrw in a previous window, unless we're opening the current dir
"if argv(0) ==# '.'
"    let g:netrw_browse_split = 0
"else
"    let g:netrw_browse_split = 4
"endif

" Assign toggle for side panel
nnoremap <leader>f :Lexplore<CR>
"nnoremap <leader>f :Explore<CR>

" Set Compatibility 
set nocompatible

" automatically indent new lines
set autoindent

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

" replace tabs with spaces automatically
set expandtab

" Set Line Number
set number relativenumber

" Shortcuts to Toggle or add functionality
map <leader>n :set number! relativenumber!<CR>

" Import .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

