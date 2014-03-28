" =====> System settings
filetype plugin indent on
syntax on
set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set tags+=~/.vim/systags
set number
set showcmd
set ignorecase
set expandtab
set backspace=indent,eol,start
set autoindent
set mouse=a
set mousehide
set hlsearch
nnoremap <CR> :nohlsearch<CR>

" =====> vundle settings
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle "scrooloose/nerdcommenter"
Bundle "majutsushi/tagbar"
Bundle "vim-scripts/cscope_macros.vim"
Bundle "jistr/vim-nerdtree-tabs"
Bundle "Shougo/neocomplcache"
Bundle "othree/html5.vim"
Bundle "scrooloose/syntastic"
Bundle "pangloss/vim-javascript"
Bundle "maksimr/vim-jsbeautify"
Bundle "plasticboy/vim-markdown"
Bundle "vim-scripts/matrix.vim--Yang"
Bundle "skammer/vim-css-color"
Bundle "tpope/vim-fugitive"
Bundle "bronson/vim-trailing-whitespace"

" =====> pathogen setting
execute pathogen#infect()

" =====> nerdtree setting
nmap <F8> :NERDTreeToggle<CR>
nmap <F7> :tabn<CR>
nmap <F6> :tabp<CR>
nmap <F5> :TagbarToggle<CR>

"=====> neocomplcache setting
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell': $HOME.'/.vimshell_hist',
    \ 'scheme'  : $HOME.'/.gosh_completions'
    \ }
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"=====> statusline
if has('statusline')
    set laststatus=2
    set statusline=%<%f\ " 文件名
    set statusline+=%w%h%m%r " 文件状态
    set statusline+=\ [%{&ff}/%Y] " 文件类型. 如unix/MKD，unix格式markdown文本
    set statusline+=\ [%{getcwd()}] " 文件路径
    set statusline+=\ [%{fugitive#statusline()}] " Git分支
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " 行列、文件进度信息
endif
set fileencodings=utf-8,gbk,usc-bom,cp93
let g:vim_markdown_folding_disabled=1

"=====> Syntastic
let g:syntastic_always_populate_loc_list = 1

"=====> vim-trailing-whitespace
noremap <leader>ss :FixWhitespace<CR>
