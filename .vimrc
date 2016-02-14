set encoding=utf-8 nobomb
scriptencoding utf-8

if &compatible | set nocompatible | endif

" no beeps or flashes
set visualbell t_vb=
set ttyfast
set lazyredraw                        " macros don't update display

set title                             " wintitle = filename - vim

filetype plugin indent on
syntax enable

set t_Co=256

set number
set relativenumber

set history=200

set tabstop=2
set shiftwidth=2
set expandtab

" turn off the bell!
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set nowrap
set nojoinspaces                      " J command doesn't add extra space

set autoindent                        " indent when creating newline
set smartindent                       " add an indent level inside braces
set cindent                           " testing cindent...

" for autoindent, use same spaces/tabs mix as previous line, even if
" tabs/spaces are mixed. Helps for docblock, where the block comments have a
" space after the indent to align asterisks
set copyindent

" Try not to change the indent structure on "<<" and ">>" commands. I.e. keep
" block comments aligned with space if there is a space there.
set preserveindent


set backspace=indent,eol,start

set ttimeout
set ttimeoutlen=50

" gVim copy to clipboard (used by firefox) instead of primary
set clipboard=unnamedplus

set incsearch
set hlsearch                 " highlight search
set showmatch                " matching brackets when over
set mat=2                    " matching time in secs

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" autocd to the file open on the current buffer
autocmd BufEnter * silent! lcd %:p:h

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

set cursorline
set cursorcolumn
" highlight Search ctermbg=black ctermfg=yellow cterm=underline
let &colorcolumn=join(range(101,255),',')
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

hi SpellBad cterm=underline,bold

" recover more
set updatecount=10
set swapsync=fsync

" easy moving code blocks
vnoremap < <gv " better identation
vnoremap > >gv " better identation

" easy moving code blocks
vnoremap < <gv " better identation
vnoremap > >gv " better identation

" Folde
set nofoldenable      " don't fold by default
set foldmethod=syntax
set foldlevel=9
noremap <Space> za
noremap <Leader>F zR
noremap <Leader>f zM


let g:ackprg = 'ag --nogroup --nocolor --column'
let g:aghighlight=1

" tern
set omnifunc=syntaxcomplete#Complete
let g:tern_map_keys=1
" let g:tern_show_argument_hints="on_hold"
let g:tern_show_argument_hints = 'on_move'

let g:used_javascript_libs = 'underscore,jasmine'

" Highlight fenced code blocks in markdown docs
let g:markdown_fenced_languages = [
      \'clojure',
      \'css',
      \'elixir',
      \'haskell',
      \'html',
      \'javascript',
      \'js=javascript',
      \'json=javascript',
      \'python',
      \'ruby',
      \'sass',
      \'scheme',
      \'sh',
      \'bash',
      \'xml'
      \]
set laststatus=2
let g:lightline = {
  \ 'colorscheme': 'PaperColor',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'lineinfo': ' %3l:%-2v',
  \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?" ".fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

map <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeCWD<CR>
let g:NERDTreeChDirMode=0
let g:NERDTreeWinSize=40
let g:NERDTreeWinPos="right"
let g:bufExplorerUseCurrentWindow=1
let g:NERDTreeIgnore = ['\.pyc$', '\.o$', '\~$']
" autocmd vimenter * if !argc() | NERDTree | endif

" ========================================================================
" Syntastic
" ========================================================================

let g:syntastic_check_on_open = 1
" let g:syntastic_quiet_warnings = 0
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 0

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_perlcritic_thres = 3

" let g:syntastic_enable_elixir_checker = 1
" let g:syntastic_elixir_checkers = ['credo']

" // https://github.com/kurko/smartest.vim
" autocmd FileType elixir map <leader>t :! mix test  --no-color<CR>
autocmd FileType elixir map <leader>t :call RunTestFile()<cr>
autocmd FileType elixir map <leader>r :call RunNearestTest()<cr>

autocmd FileType javascript map <leader>t :! npm test -- %<CR>

" eslint on radar!
let g:syntastic_javascript_checkers = ['eslint']
let g:jshint_highlight_color = "Red"

" " jsbeautify
autocmd FileType javascript noremap <buffer> _t :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> _t :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> _t :call CSSBeautify()<cr>

" Elm
autocmd FileType elm noremap <buffer> _t :ElmFormat<cr>

" let g:tern_show_argument_hints="on_hold"
let g:tern_show_argument_hints = 'on_move'

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

" Java
autocmd FileType * if &ft != 'java' | let b:SuperTabDisabled = 1 | endif
au FileType java setlocal copyindent preserveindent sts=0 sw=4 ts=4 textwidth=100


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

let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetsDir = '~/.vim/mysnippets/'
let g:UltiSnipsSnippetDirectories = ['mysnippets']


let $GIT_SSL_NO_VERIFY = 'true' " required in the corporate network


" ========================================================================
" Plugins:  https://github.com/junegunn/vim-plug
" ========================================================================

call plug#begin()

Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'

Plug 'scrooloose/syntastic'

Plug 'vim-scripts/argtextobj.vim'
Plug 'michaeljsmith/vim-indent-object'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'vim-scripts/ctrlp.vim'


Plug 'mhinz/vim-signify'
Plug 'rking/ag.vim'

Plug 'vim-scripts/UltiSnips'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-markdown'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Plug 'suan/vim-instant-markdown', {
"       \   'do': 'npm install -g instant-markdown-d'
"       \ }

" ========================================================================
" Language: YAML
" ========================================================================

Plug 'ingydotnet/yaml-vim'

" ========================================================================
" Language: Elixir
" ========================================================================

Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'markdown'] }
Plug 'kurko/smartest.vim'

" https://github.com/rgrinberg/mix_ctags
Plug 'majutsushi/tagbar', { 'for': ['elixir'], 'on': 'TagbarOpenAutoClose' }

" Hit :EX and vim will prompt you to include the path of your new module
" for shopping/cart will generate two files: lib/shopping/cart.ex and test/shopping/cart_test.exs
Plug 'jadercorrea/elixir_generator.vim'

Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-runtime'

" ========================================================================
" Language: Javascript
" ========================================================================

Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

" Plug 'moll/vim-node' " gf
" Plug 'einars/js-beautify'
Plug 'maksimr/vim-jsbeautify', {
  \ 'do': 'git submodule update --init --recursive'
  \ }

Plug 'editorconfig/editorconfig-vim'

Plug 'elzr/vim-json'

Plug 'junegunn/vim-easy-align'
Plug 'ervandew/supertab'

Plug 'elmcast/elm-vim'


call plug#end()

" settings depending of plugins:

set background=light
colorscheme PaperColor

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:SuperTabDefaultCompletionType = 'context'

" Run Checkstyle on open/write
autocmd BufWinEnter *.java :Checkstyle
autocmd BufWritePost *.java :Checkstyle

" https://github.com/avh4/elm-format
let g:elm_format_autosave = 0

" search operators {{{
map g/ <Plug>(operator-ag)
map gw <Plug>(operator-ag-word)
map gh <Plug>(operator-dash)

nnoremap <silent> <leader>k :Dash<CR>

nnoremap <Leader>aa :Ag!<space>
nnoremap <Leader>aw :Ag! -w<space>
nnoremap <Leader>aq :Ag -Q<space>
nnoremap <Leader>as :Ag ''<left>
