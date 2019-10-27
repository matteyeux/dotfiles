" :%s/hello/bye/g < replace string
set showmatch
set nu
set tabstop=4
set autoindent
set shiftwidth=4
set cursorline
set noswapfile
set nobackup
set nowritebackup
set encoding=utf-8
set incsearch		" Shows the match while typing
set ignorecase		" Search case insensitive...
set background=dark " vim bg will change when running in tmux

" if python file set this
au Filetype python set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ expandtab
    \ autoindent

hi CursorLine term=bold cterm=bold
syntax on
set hlsearch
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


function! InsertMarker()
    let string = "printf(\"========= %s:%d:%s() - \\n\", __FILE__, __LINE__, __func__);"
    call append(line('.'), string)
endfunction

command Marker call InsertMarker()
map mm :Marker<enter>
