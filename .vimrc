" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''

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
set expandtab

" Set Line Number
set number relativenumber

" Shortcuts to Toggle or add functionality
map <leader>l :set number! relativenumber!<CR>

" Import .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

