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
