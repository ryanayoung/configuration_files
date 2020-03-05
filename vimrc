set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=a             
set autoread
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping
set expandtab
set shiftwidth=3
set tabstop=3
:set number
:set colorcolumn=100
:highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

:let mapleader = "," " adds an extra "leader" button to create new commands

:nnoremap <leader>ev :vsplit $MYVIMRC<cr> " edit .vimrc quickly
:nnoremap <leader>sv :source $MYVIMRC<cr> " reload .vimrc quickly
:nnoremap <leader>ex :Vexplore<cr>:vertical resize 20<cr>:set winfixwidth<cr>
:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <leader>b :bn<cr> 
:nnoremap <F6> :tabs<CR>

:inoremap jk <esc> " exit insert mode quickly
:nnoremap <space> za " make space more useful



nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction

colorscheme sonofobsidian 

syntax enable
filetype plugin on

set path+=**

command! MakeTags !ctags -R .

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'


fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

call SetupCommandAlias("vres","vertical resize")
