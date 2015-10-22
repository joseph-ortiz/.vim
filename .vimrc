" Vundle
"" Required for Vundle
 set nocompatible
 filetype off

 " Start Vundle
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

Plugin 'gmarik/Vundle.vim'        " Let Vundle manage Vundle
Plugin 'pangloss/vim-javascript'  " JS syntax and indentation
Plugin 'kien/ctrlp.vim'           " CtrlP fuzzy file finder
Plugin 'Yggdroot/indentLine'      " Indent line guides
Plugin 'altercation/vim-colors-solarized' "Solarized
Plugin 'scrooloose/nerdtree'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Miscenalenous
set number "shows the line number on.


"Soloarzied Theme
syntax enable
colorscheme solarized
if has('gui_running')
   set background=light
else
  set background=dark
endif



set runtimepath^=~/.vim/bundle/ctrlp.vim
set cursorline
set showmatch

"NerdTree 
map <C-n> :NERDTreeToggle<CR> "map nerd-tree to Ctrl + N

 ""the lines below opens nerdtree if no file is specified
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" vertical line indentation
 let g:indentLine_color_term = 239
 let g:indentLine_color_gui = '#09AA08'
 let g:indentLine_char = '│'

 "deliminate to autoclose tags
 "let delimitMate_expand_cr = 1
""Color file
" Converted from my Textmate Code School theme using Coloration
" http://astonj.com

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif
