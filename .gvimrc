colorscheme jellybeans

set guioptions-=m " Removes menu
set guioptions-=T " Removes top toolbar

set guioptions-=R " Removes right hand scroll bar
set guioptions-=r " Removes right hand scroll bar
set guioptions-=b " Removes bottom scroll bar
set go-=L " Removes left hand scroll bar

" nice copy and paste
set guioptions+=a

" Nice window title
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f " file name
    set titlestring+=%h%m%r%w " flags
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')} " working directory
endif
