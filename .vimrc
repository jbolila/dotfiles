set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'

Plugin 'NLKNguyen/papercolor-theme'
Plugin 'nanotech/jellybeans.vim'
" Plugin 'altercation/vim-colors-solarized'

Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/ctrlp.vim'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'

Plugin 'vim-scripts/UltiSnips'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'reedes/vim-litecorrect'
Plugin 'reedes/vim-wordy'

Plugin 'einars/js-beautify'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'

Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'

Plugin 'mhinz/vim-signify'
Plugin 'rking/ag.vim'

Plugin 'vim-scripts/argtextobj.vim'
Plugin 'michaeljsmith/vim-indent-object'

" Rust
" Plugin 'rust-lang/rust.vim'
" Plugin 'cespare/vim-toml'
" Plugin 'phildawes/racer'

if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif

call vundle#end()

let $GIT_SSL_NO_VERIFY = 'true' " required in the corporate network

filetype plugin indent on
syntax enable

set encoding=utf8
set t_Co=256
" let g:solarized_termcolors=256

set background=light
colorscheme PaperColor
" colorscheme jellybeans
" colorscheme solarized

set number
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab

" turn off the bell!
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set autoindent
set backspace=indent,eol,start

set ttimeout
set ttimeoutlen=50

set incsearch
set hlsearch                 " highlight search
set showmatch                " matching brackets when over
set mat=2                    " matching time in secs

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <leader>c <C-w>c
nnoremap <leader>h <C-w>3h
nnoremap <leader>j <C-w>3j
nnoremap <leader>k <C-w>3k
nnoremap <leader>l <C-w>3l

" To real pratice disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

nnoremap ;; m`A;<Esc>``

set cursorline
" highlight Search ctermbg=black ctermfg=yellow cterm=underline
let &colorcolumn=join(range(81,255),',')
set list listchars=tab:→\ ,trail:·
highlight Whitespace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=lightred guifg=lightred
autocmd ColorScheme * highlight Whitespace gui=underline ctermbg=NONE guibg=NONE ctermfg=lightred guifg=lightred
match Whitespace /[^ ]\zs \s\+/

" remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Quick Save
noremap <C-z> :update<CR>
vnoremap <C-z> <C-C>:update<CR>

" tabs (:h tabpage)
set tabpagemax=15

" Set region to British English
set spelllang=en_gb

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

hi clear SpellBad
hi SpellBad cterm=underline ctermfg=white ctermbg=blue

autocmd FileType gitcommit setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell


" recover more
set updatecount=10
set swapsync=fsync

" easy moving code blocks
vnoremap < <gv " better identation
vnoremap > >gv " better identation

" easy moving code blocks
vnoremap < <gv " better identation
vnoremap > >gv " better identation

set nofoldenable      " don't fold by default
set foldmethod=syntax
set foldlevel=9
noremap <Space> za
noremap <Leader>F zR
noremap <Leader>f zM

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" completion:
set path=**
set complete-=i

" dir completion <S-Tab>
set wildmenu
set wildmode=longest:full,list:full

let g:ackprg = 'ag --nogroup --nocolor --column'
let g:aghighlight=1


" " Plugin configuration:

let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetsDir = '~/.vim/mysnippets/'
let g:UltiSnipsSnippetDirectories = ['mysnippets']

set laststatus=2
let g:lightline = {
  \ 'component': {
  \   'lineinfo': ' %3l:%-2v',
  \ },
  \ 'component_function': {
  \   'readonly': 'MyReadonly',
  \   'fugitive': 'MyFugitive'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

function! MyReadonly()
  return &readonly ? '' : ''
endfunction

function! MyFugitive()
  if exists('*fugitive#head')
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

map <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeCWD<CR>
let g:NERDTreeChDirMode=0
let g:NERDTreeWinSize=40
let g:NERDTreeWinPos="right"
let g:bufExplorerUseCurrentWindow=1
let g:NERDTreeIgnore = ['\.pyc$', '\.o$', '\~$']
autocmd vimenter * if !argc() | NERDTree | endif

nnoremap <leader>b :CtrlPBuffer<CR>    " CtrlP on buffers
nnoremap <leader>. :CtrlPTag<CR>    " ctags integration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" exclude
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/lib/* " Evel!!
" breaks the vim-jsbeautify plugin!
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc|so|swp)$',
  \ }


" Programming!

let g:syntastic_check_on_open = 1
" let g:syntastic_quiet_warnings = 0
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 0

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_perlcritic_thres = 3

" au FileType javascript call JavaScriptFold()

" eslint on radar!
let g:syntastic_javascript_checkers = ['eslint']
let g:jshint_highlight_color = "Red"

" " jsbeautify
autocmd FileType javascript noremap <buffer> _t :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> _t :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> _t :call CSSBeautify()<cr>

autocmd BufNewFile,BufRead *.c set formatprg=astyle\ --style=linux
autocmd BufNewFile,BufRead *.h set formatprg=astyle\ --style=linux

" relay on max_line_length (in the .editorconfig file)
let g:EditorConfig_max_line_indicator = "fill"

" GIT
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

autocmd BufReadPost fugitive://* set bufhidden=delete

" for Gdiff opens a new tab and diffs the file in the active window against
" common ancestor (:tabclose to close the tab).
nnoremap <leader>ga :tab sp \| Gvedit :1 \| windo diffthis<CR>


let perl_include_pod=1

au BufNewFile,BufRead *.psgi,*.t set filetype=perl
au BufNewFile,BufRead *.mc,*.mp set filetype=mason

au FileType perl setlocal noexpandtab copyindent preserveindent sts=0 sw=4 ts=4

au FileType perl nnoremap <silent> _t :%!perltidier -q<cr>
au FileType perl vnoremap <silent> _t :!perltidier -q<cr>

nnoremap <silent>_pc :compiler perlcritic<cr>:make<cr>:cope<cr><cr>

" let g:syntastic_perl_lib_path = ['./lib']
" let g:syntastic_perl_perlcritic_args = ''

autocmd FileType perl inoremap  <leader>;     <C-o>A;

" set perl lib to the used at the moment
if has('perl')
   let myINC = system("perl -e '$,=\" \";print @INC'")
   perl push @INC, split(/ /,VIM::Eval("myINC"))
endif

let perl_fold=1

" pjcj/vim-hl-var
" let g:hlvarhl="ctermbg=black ctermfg=red guifg=#ff0000 guibg=#000000 gui=bold"

" " Rust.lang

" " tagbar
" let g:tagbar_type_rust = {
"     \ 'ctagstype' : 'rust',
"     \ 'kinds' : [
"         \'T:types,type definitions',
"         \'f:functions,function definitions',
"         \'g:enum,enumeration names',
"         \'s:structure names',
"         \'m:modules,module names',
"         \'c:consts,static constants',
"         \'t:traits,traits',
"         \'i:impls,trait implementations',
"     \]
"     \}

" " let g:racer_cmd = "/Users/jbolila/local/bin/racer"
" " let $RUST_SRC_PATH="/home/jbolila/local/rustc-1.1.0/src/"

" augroup litecorrect
"   autocmd!
"   autocmd FileType markdown,mkd call litecorrect#init()
"   autocmd FileType textile call litecorrect#init()
" augroup END

