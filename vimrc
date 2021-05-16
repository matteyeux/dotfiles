" this adds dracula theme
let g:dracula_italic = 0
packadd! dracula
colorscheme dracula
highlight Normal ctermbg=None

if (has("termguicolors"))
	set termguicolors
endif

set showmatch
set nu
set tabstop=4
set autoindent
set shiftwidth=4
set noswapfile
set nobackup
set nowritebackup
set encoding=utf-8
set incsearch		" Shows the match while typing
set ignorecase		" Search case insensitive...
set background=dark " vim bg will change when running in tmux

set list
set listchars=tab:>.,trail:.


set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

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

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
