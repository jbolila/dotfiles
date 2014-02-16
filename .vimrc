set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'nanotech/jellybeans.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tomtom/tcomment_vim'
Bundle 'Raimondi/delimitMate'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/UltiSnips'

Bundle 'myhere/vim-nodejs-complete'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'

Bundle 'mhinz/vim-signify'
Bundle 'mileszs/ack.vim'

Bundle 'vim-scripts/perlhelp.vim'
Bundle 'rkitover/perl-vim-mxd'

Bundle 'mattn/emmet-vim'


filetype plugin indent on
syntax enable

colorscheme jellybeans

set t_Co=256
syntax enable

" highlight the maximum textwidth limit using a colored column
set colorcolumn=+1
autocmd ColorScheme * highlight! link ColorColumn CursorColumn

set keywordprg=":help"

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

set autoindent
set backspace=indent,eol,start

set ttimeout
set ttimeoutlen=50

set incsearch
set hlsearch

let mapleader = ","
let g:mapleader = ","

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <leader>c <C-w>c
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" To real pratice disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set hlsearch                 " highlight search
set showmatch                " matching brackets when over
set mat=2                    " matching time in secs

set tabstop=2
set shiftwidth=2
set expandtab

" easy moving code blocks
vnoremap < <gv " better identation
vnoremap > >gv " better identation

set nofoldenable      "dont fold by default
set foldmethod=indent
set foldlevel=9
noremap <Space> za
noremap <Leader>F zR
noremap <Leader>f zM


" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

set cursorline
" highlight Search ctermbg=black ctermfg=yellow cterm=underline
set colorcolumn=+1
set list listchars=tab:→\ ,trail:·
highlight Whitespace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=lightred guifg=lightred
autocmd ColorScheme * highlight Whitespace gui=underline ctermbg=NONE guibg=NONE ctermfg=lightred guifg=lightred
match Whitespace /[^ ]\zs \s\+/

" remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Quick Save
noremap <C-z> :update<CR>
vnoremap <C-z> <C-C>:update<CR>

" Set region to British English
set spelllang=en_gb

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=white ctermbg=red


" Plugins:

" airline
let g:airline_powerline_fonts = 1
set laststatus=2

map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=0
let g:NERDTreeWinSize=40
let g:NERDTreeWinPos="right"
let g:bufExplorerUseCurrentWindow=1
" let g:NERDTreeIgnore = ['\.pyc$']
autocmd vimenter * if !argc() | NERDTree | endif

nnoremap <leader>. :CtrlPTag<CR>    " ctags integration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" exclude
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc|so|swp)$',
  \ }

" completion:
set path=**
set complete-=i

" Emmet
let g:user_emmet_mode='a'    "only enable normal mode functions.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

inoremap <lt>/ </<C-X><C-O>
inoremap <leader>/ </<C-X><C-O>

" dir completion <S-Tab>
set wildmenu
set wildmode=longest:full,list:full

let g:ackprg = 'ag --nogroup --nocolor --column'

" TCOMMENT
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" PROGRAMMING

let g:syntastic_check_on_open = 1
" let g:syntastic_quiet_warnings = 0
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 0

let g:syntastic_javascript_checkers = ['jshint']
let g:jshint_highlight_color = "Red"

"let g:syntastic_python_checker_args='--ignore=E501,E302,E231,E261,E201,W402,W293'
let syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_python_checkers=['pylint']

let g:tagbar_autoclose = 1
" set runtimepath+=~/.vim/__WHAT_DIR_THEY_WANT__

" YouCompleteMe
let g:ycm_key_list_previous_completion=['<c-h>']
let g:ycm_key_list_select_completion=['<c-l>']

let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit = "horizontal"
let g:UltiSnipsDontReverseSearchPath = "1"
let g:UltiSnipsSnippetsDir = '~/.vim/mysnippets/'
let g:UltiSnipsSnippetDirectories = ['mysnippets']

" JAVASCRIPT / HTML

autocmd FileType javascript set omnifunc=nodejscomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" jsbeautify
autocmd FileType javascript noremap <buffer> _t :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> _t :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> _t :call CSSBeautify()<cr>

" :unlet b:npm_module_names # WHEN node_modules change!

autocmd FileType javascript setlocal expandtab shiftwidth=4 softtabstop=4

" PERL

let perl_include_pod=1

au BufNewFile,BufRead *.psgi,*.t set filetype=perl
au BufNewFile,BufRead *.mc,*.mp set filetype=mason
" autocmd FileType perl setlocal expandtab shiftwidth=4 softtabstop=4
au FileType perl nnoremap <silent> _t :%!perltidier -q<cr>
au FileType perl vnoremap <silent> _t :!perltidier -q<cr>

nnoremap <silent>_pc :compiler perlcritic<cr>:make<cr>:cope<cr><cr>

" let g:syntastic_perl_lib_path = ['./lib']
let g:syntastic_perl_perlcritic_thres = 3
" let g:syntastic_perl_perlcritic_args = ''

autocmd FileType perl inoremap  <leader>;     <C-o>A;

" set perl lib to the used at the moment
if has('perl')
   let myINC = system("perl -e '$,=\" \";print @INC'")
   perl push @INC, split(/ /,VIM::Eval("myINC"))
endif

let perl_fold=1

" http://blog.stwrt.ca/2012/10/31/vim-ctags
nnoremap <silent> <leader>t :TagbarToggle<CR>

" Tagbar settings to recognise Perl Moose
let g:tagbar_type_perl = {
    \ 'ctagstype'   : 'Perl',
    \ 'kinds' : [
        \ 'p:packages:1:0',
        \ 'u:uses:1:0',
        \ 'r:requires:1:0',
        \ 'e:extends',
        \ 'w:roles',
        \ 'o:ours:1:0',
        \ 'c:constants:1:0',
        \ 'f:formats:1:0',
        \ 'a:attributes',
        \ 's:subroutines',
        \ 'x:around:1:0',
        \ 'l:aliases',
        \ 'd:pod:1:0',
    \ ],
\ }

" # Ovid (BBC) Turbo Charged Test Suites
" # vim $(ack -l --perl 'api/v1/episode' t/)
map <leader>tb :call RunTestsInBuffers()<CR>
function! RunTestsInBuffers()
  let i = 1
  let tests = ''
  while (i <= bufnr("$"))
    let filename = bufname(i)
    if match(filename, '\.t$') > -1
      let tests = tests . ' "' . filename . '"'
    endif
    let i = i+1
  endwhile
  if !strlen(tests)
    echo "No tests found in buffers"
  else
    execute ':!prove ' . tests
  endif
endfunction

" end perl

" GIT
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

autocmd BufReadPost fugitive://* set bufhidden=delete
