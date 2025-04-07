set number
set relativenumber
set encoding=UTF-8
set autoindent
set cursorline
set showmatch
set mouse=a
"set signcolumn=number
set signcolumn=yes
set splitright
set splitbelow
syntax on
filetype on
colorscheme pablo
set expandtab                  " Заменяем табуляции на пробелы
set tabstop=4                  " Количество пробелов для табуляции
set shiftwidth=4               " Количество пробелов при автодобавлении отступов
set softtabstop=4              " Количество пробелов при автотабуляции

set smarttab                   " Умное поведение табуляции
set smartindent                " Умное выравнивание для кода

highlight CursorLineNr ctermfg=NONE guifg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE

"copy and paste from sysytem buffer
nnoremap <C-y> "+p
vnoremap <C-y> "+y

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)

highlight CocGitAddedSign     ctermbg=46  ctermfg=16 
highlight CocGitChangedSign   ctermbg=27 ctermfg=16 
highlight CocGitRemovedSign   ctermbg=196 ctermfg=16 

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }


inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>
let NERDTreeMapOpenInTab = '<C-t>'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline_theme='deus'


" Use <c-space> to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

let g:airline#extensions#hunks#coc_git = 1
function! s:update_git_status()
  let g:airline_section_b = "%{get(g:,'coc_git_status','')}"
endfunction

let g:airline_section_b = "%{get(g:,'coc_git_status','')}"

autocmd User CocGitStatusChange call s:update_git_status()


