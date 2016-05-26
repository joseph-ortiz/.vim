set number
syntax on

set pastetoggle=<F10> "toggle paste mode in vim to f10

"vim jsx
let g:jsx_ext_required = 0
if has("unix")
  let s:uname = system("uname")
  let g:python_host_prog='/usr/bin/python'
  if s:uname == "Darwin\n"
    let g:python_host_prog='/usr/local/bin/python' " # found via `which pythonx
  endif
endif

if has('nvim')
    let s:editor_root=expand("~/.nvim")
else
    let s:editor_root=expand("~/.vim")
endif

set t_Co=256
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif
set cursorline
set showcmd
set number
set hidden
set hlsearch
set backspace=2
let mapleader=","
autocmd Filetype html setlocal ts=4 sts=4 sw=4 omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal ts=4 sts=4 sw=4
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType css setlocal ts=4 noet sw=4 omnifunc=csscomplete#CompleteCSS
autocmd bufread *.coffee set ft=coffee
autocmd bufread *.less set ft=less
autocmd bufread *.md set ft=markdown
autocmd bufread Cakefile set ft=coffee
if has('nvim')
    let s:editor_root=expand("~/.nvim")
else
    let s:editor_root=expand("~/.vim")
endif
if has("unix")
    let s:uname = system("uname")
    let g:python_host_prog='/usr/bin/python'
    if s:uname == "Darwin\n"
        let g:python_host_prog='/usr/bin/python'
    endif
endif

" Setting up Vundle - the vim plugin bundler
"let vundle_installed=1
"let vundle_readme=s:editor_root . '/bundle/vundle/README.md'
"if !filereadable(vundle_readme)
"    echo "Installing Vundle.."
"    echo ""
    " silent execute "! mkdir -p ~/." . s:editor_path_name . "/bundle"
"    silent call mkdir(s:editor_root . '/bundle', "p")
"    silent execute "!git clone https://github.com/gmarik/vundle " . s:editor_root . "/bundle/vundle"
"    let vundle_installed=0
"endif
"let &rtp = &rtp . ',' . s:editor_root . '/bundle/vundle/'
"call vundle#rc(s:editor_root . '/bundle')
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

"Plugin 'gmarik/Vundle.vim'

" Plugins go here

"call vundle#end()
"filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'gmarik/vundle.vim'
Plug 'szw/vim-ctrlspace'
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/syntastic'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'vim-scripts/taglist.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'thinca/vim-localrc'
Plug 'groenewege/vim-less'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'rstacruz/sparkup'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/pydoc.vim'
Plug 'junegunn/vim-easy-align'
Plug 'bronson/vim-trailing-whitespace'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'icholy/typescript-tools'
Plug 'hsanson/vim-android'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elixir-lang/vim-elixir'
au BufRead,BufNewFile *.ts  setlocal filetype=typescript

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

if !exists("g:ycm_semantic_triggers")
       let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
set completeopt-=preview


"if vundle_installed == 0
"    echo "Installing Plugs, please ignore key map error messages"
"    echo ""
"    :PlugInstall
"endif
" Setting up Vundle - the vim plugin bundler end
call plug#end()
set laststatus=2

filetype plugin indent on

inoremap jj <Esc>
nnoremap <leader>m :w <BAR> !lessc %:t:r.css<CR><space>
nnoremap <F5> :buffers<CR>:buffer<Space>
nmap <leader>ne :NERDTree<cr>
nmap <leader>nt :NERDTree<cr>
nmap <leader>nq :NERDTreeClose<cr>
map <leader>n :bn<cr>
map <leader>p :bp<cr>
nmap <silent> <leader>l :set list!<CR>
map <silent> <leader>/ :let @/ = ""<CR>

set listchars=tab:▸\ ,eol:¬

let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore = ['\.pyc$']

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
let &colorcolumn="110,".join(range(116,999),",")

let g:syntastic_check_on_open = 1

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_theme="dark"
" Required for CtrlSpace integration
let g:airline_exclude_preview = 1
" End CtrlSpace integration
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'z', 'warning' ]
    \ ]

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|site-packages|node_modules)$',
    \ 'file': '\v\.(exe|so|dll|pyc|debug\.js|simple\.js)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
let g:ctrlp_reuse_window = 'startify'

let g:clang_library_path = '/usr/lib/llvm-3.2/lib/'

let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'z' ]
      \ ]

let g:ctrlspace_project_root_markers = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS", "proj.sln"]

" Set up ultisnips - need to symlink vim scripts to be run when files are opened
if !isdirectory(s:editor_root . "/ftdetect")
    silent execute "!ln -s " . s:editor_root . "/bundle/ultisnips/ftdetect " . s:editor_root . "/"
endif
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsListSnippets="<c-l>"
"let g:UltiSnipsEditSplit="vertical"
"let g:ultisnips_python_style="sphinx"

" set viminfo='100,n$HOME/.vim/files/info/viminfo " Change to nvim agnostic path if necessary

function! NumberOfWindows()
  let i = 1
  while winbufnr(i) != -1
  let i = i+1
  endwhile
  return i - 1
endfunction

function! DonotQuitLastWindow()
  if NumberOfWindows() != 1
    let v:errmsg = ""
    silent! quit
    if v:errmsg != ""
        "echohl ErrorMsg | echomsg v:errmsg | echohl NONE
        "echoerr v:errmsg
        echohl ErrorMsg | echo v:errmsg | echohl NONE
    endif
  else
     echohl Error | echo "Can't quit the last window..." | echohl None
  endif
endfunction

if has("gui_running")
    cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'call DonotQuitLastWindow()' : 'q'
    cnoreabbrev <expr> qa getcmdtype() == ":" && getcmdline() == 'qa' ? 'call DonotQuitLastWindow()' : 'qa'
endif

set bg=dark
colorscheme Tomorrow-Night-Eighties

hi Search ctermfg=237 ctermbg=13
hi MatchParen cterm=underline
hi SyntasticWarning ctermbg=yellow ctermfg=black
hi SyntasticError ctermbg=red ctermfg=black

hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
hi CtrlSpaceSearch   ctermfg=220  ctermbg=NONE cterm=bold
hi CtrlSpaceStatus   ctermfg=230  ctermbg=234  cterm=NONE

let &titleold=substitute(system("uname"),'\(.*\)\n','%\1%','')
let &titlestring = expand("%:p")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term =~ "xterm" || &term =~ "nvim"
  set title
endif

"nerd tree
map <C-n> :NERDTreeToggle<CR>


"vim-android
let g:android_sdk_path = '/Users/jortiz/Library/Android/sdk'
