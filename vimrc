" this adds dracula theme
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'
highlight Normal ctermbg=None

if (has("termguicolors"))
	set termguicolors
endif

set showmatch
set nu
set autoindent
set noswapfile
set nobackup
set nowritebackup
set encoding=utf-8
set incsearch       " Shows the match while typing
set ignorecase      " Search case insensitive...
set background=dark " vim bg will change when running in tmux

set list
set listchars=tab:>.,trail:.


set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType yaml set noexpandtab shiftwidth=2 softtabstop=2


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

if exists('$TMUX')
    let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
    let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
    set termguicolors
    set term=xterm-256color
endif

