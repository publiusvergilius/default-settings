set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" Better wrapping
set breakindent
set breakindentopt=shift:2

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" global clipboard
vnoremap <leader>8 "*y
vnoremap <leader>9 "*p
nnoremap <leader>8 "*p

" FOLDS
nnoremap <leader>z za<CR>
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

