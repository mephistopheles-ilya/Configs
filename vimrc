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
"colorscheme pablo
set expandtab                  " Заменяем табуляции на пробелы
set tabstop=4                  " Количество пробелов для табуляции
set shiftwidth=4               " Количество пробелов при автодобавлении отступов
set softtabstop=4              " Количество пробелов при автотабуляции

set smarttab                   " Умное поведение табуляции
set smartindent                " Умное выравнивание для кода

set updatetime=300
let mapleader = " "


highlight SignColumn ctermbg=NONE

"copy and paste from sysytem buffer
nnoremap <C-y> "+p
vnoremap <C-y> "+y

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'joshdick/onedark.vim'
call plug#end()

let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline_powerline_fonts = 0
let g:airline_section_z = 'line %3l/%L col %2c'

colorscheme onedark

highlight CursorLineNr ctermfg=NONE ctermbg=NONE
highlight CursorLine ctermfg=None ctermbg=NONE cterm=underline
highlight LineNr ctermfg=87

nmap gi :CocCommand git.chunkInfo<CR>
nmap gud :CocCommand git.chunkUndo<CR>
nmap gs :CocCommand git.chunkStage<CR>
nmap gus :CocCommand git.chunkUnstage<CR>
nmap gc :CocCommand git.showCommit<CR>

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



" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Highlight the symbol and its references when holding the cursor
"autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <leader>h :call CocActionAsync('highlight')<CR>

highlight CocHighlightText ctermbg=238 ctermfg=226 cterm=italic
highlight CocHighlightRead ctermbg=237 ctermfg=226 cterm=italic
highlight CocHighlightWrite ctermbg=237 ctermfg=226 cterm=italic

let g:airline#extensions#hunks#coc_git = 1
function! s:update_git_status()
  let g:airline_section_b = "%{get(g:,'coc_git_status','')}"
endfunction

let g:airline_section_b = "%{get(g:,'coc_git_status','')}"

autocmd User CocGitStatusChange call s:update_git_status()

