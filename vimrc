set number
set relativenumber
set encoding=UTF-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set smartindent
set cursorline
set showmatch
set title
set ttimeoutlen=50
set mouse=a
set signcolumn=number
set splitright
set splitbelow
syntax on
filetype on
colorscheme pablo

set ruler
set backspace=indent,eol,start
set nowrap
set modelines=0
set background=dark
set numberwidth=1

highlight CursorLineNr ctermfg=NONE guifg=NONE


set tags=./tags,tags;$HOME


" Function to open a tag in a new tab
function! OpenTagInNewTab()
    let l:tag = expand("<cword>")
    if empty(l:tag)
        return
    endif
    tabnew
    execute 'tag ' . l:tag
endfunction

" Map C-] to the new function
nnoremap <C-]> :call OpenTagInNewTab()<CR>

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
call plug#end()

inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline_theme='deus'

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()


