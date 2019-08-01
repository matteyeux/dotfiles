# :%s/hello/bye/g < replace string
set showmatch
set nu
set tabstop=4
set autoindent
set shiftwidth=4
set cursorline
hi CursorLine term=bold cterm=bold
syntax on
set hlsearch
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
