" Vundle
" Required for Vundle
 set nocompatible
 filetype off

 " Start Vundle
" Setting up Vundle - the vim plugin bundler
let vundle_installed=1
let vundle_readme=s:editor_root . '/bundle/vundle/README.md'
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    " silent execute "! mkdir -p ~/." . s:editor_path_name . "/bundle"
    silent call mkdir(s:editor_root . '/bundle', "p")
    silent execute "!git clone https://github.com/gmarik/vundle " . s:editor_root . "/bundle/vundle"
    let vundle_installed=0
endif

let &rtp = &rtp . ',' . s:editor_root . '/bundle/vundle/'
call vundle#rc(s:editor_root . '/bundle')
 
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

Plugin 'gmarik/Vundle.vim'        " Let Vundle manage Vundle
Plugin 'pangloss/vim-javascript'  " JS syntax and indentation
Plugin 'kien/ctrlp.vim'           " CtrlP fuzzy file finder
Plugin 'Yggdroot/indentLine'      " Indent line guides
Plugin 'scrooloose/nerdtree' "tree folder for vim
Plugin 'scrooloose/syntastic' "external syntax checker
Plugin 'tpope/vim-dispatch' "kicks off builds and test suites
Plugin 'mattn/emmet-vim' "snippets for html
Plugin 'bling/vim-airline' "lean & mean status/tabline for vim that's light as air
Plugin 'KabbAmine/gulp-vim' "gulp for vim
Plugin 'maksimr/vim-jsbeautify' "beautifier for JS
Plugin 'einars/js-beautify' "dependency for vim-jsbeautify
Plugin 'fatih/vim-go' "GoLang Support
Plugin 'majutsushi/tagbar' "tagbar
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'} "drac theme
Plugin 'nsf/gocode', {'rtp': 'vim/'} "Golang support
Plugin 'vim-ruby/vim-ruby' "ruby syntax
Plugin 'mxw/vim-jsx' "vim jsx syntax
Plugin 'isRuslan/vim-es6' "es6 syntax
Plugin 'KurtPreston/vim-autoformat-rails' "autoformat rails
Plugin 'leafgarland/typescript-vim' "Typescript vim
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" Dracula Color theme
syntax on
color dracula

"Golang Vim settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1

"tagbar  
nmap <F8> :TagbarToggle<CR> 


"JSX
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"Miscenalenous
set number "shows the line number on.
let g:backspace=2 "backspace works

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

"theme
set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

"JSBeautify
set hidden
map <c-f> :call JsBeautify()<cr>
  " or
  autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
  " for json 
  autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
  " for jsx 
  autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
  " for html
  autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  " for css or scss
  autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


  "GoTags
  let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
          \ 'p:package',
          \ 'i:imports:1',
          \ 'c:constants',
          \ 'v:variables',
          \ 't:types',
          \ 'n:interfaces',
          \ 'w:fields',
          \ 'e:embedded',
          \ 'm:methods',
          \ 'r:constructor',
          \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
          \ 't' : 'ctype',
          \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
          \ 'ctype' : 't',
          \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

"vim-airline setup
let g:airline#extensions#tabline#enabled = 1
let g:laststatus=2 
" vim airline all the time
