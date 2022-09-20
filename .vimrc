" map leader to comma
let mapleader = "," 

" Set Compatibility 
set nocompatible

" Enable text Wrapping
set wrap

" Set Line Number
"set number relativenumber

" Set Vim update time
set updatetime=100

" Status Bar
set laststatus=2

" Set tab spacing
set tabstop=4

" Shortcuts to Toggle or add functionality
map <leader>f :NERDTreeToggle<CR>
map <leader>n :set number relativenumber<CR>

" Shortcuts to Remove functionality
let mapleader = "-"
map <leader>n :set nonumber norelativenumber<CR>

" Import .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

