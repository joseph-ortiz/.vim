execute pathogen#infect() 
"needed for pathogen modules to be executed
set nocompatible
syntax on "needed for syntax checking
filetype plugin indent on "adds indenting on filetype
set number "shows the line number on.
syntax enable "enables syntax highlight for code
set background=dark "sets background to black
let g:solarized_termcolors=256 "needed for solarized theme
colorscheme solarized "adds solarized theme
set runtimepath^=~/.vim/bundle/ctrlp.vim
set cursorline
set showmatch
autocmd vimenter * NERDTree "starts nerdree on vim startup

 set autowrite " two lines below are only needed if plugin is installed without using
 " pathogen
 "  let &runtimepath=&runtimepath . ',c:\Documents and
 "  Settings\user\vimfiles\vim-force.com'
 "   runtime ftdetect/vim-force.com.vim
 "    
 "
 "
