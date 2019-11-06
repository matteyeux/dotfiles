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

" if python or yaml file set this
au Filetype python,yaml set
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

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Turning off auto indent when pasting text into vim
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
