execute pathogen#infect()

" Plugins setting
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar' " fix exuberant ctags

call vundle#end()
filetype plugin indent on

" System setting
syntax enable
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set tags+=~/.vim/systags
set number
set showcmd
set ignorecase
set backspace=indent,eol,start
set autoindent
set mouse=a
set mousehide
set fileencodings=utf-8
set laststatus=2 " always show statusline
set hlsearch
nnoremap <CR> :nohlsearch<CR>
:vmap <C-c> "+y " Global copy for linux

" Nerdtree
nmap <F8> :NERDTreeToggle<CR>
nmap <F7> :tabn<CR>
nmap <F6> :tabp<CR>
" Tagbar
nmap <F5> :TagbarToggle<CR>

" Neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif

" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
     \ "\<Plug>(neosnippet_expand_or_jump)"
     \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
     \ "\<Plug>(neosnippet_expand_or_jump)"
     \: "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Syntastic
let g:syntastic_always_populate_loc_list = 1

"vim-trailing-whitespace
noremap <leader>ss :FixWhitespace<CR>

" vim-markdown
let g:vim_markdown_folding_disabled=1

" Solarized theme
set background=dark
colorscheme solarized

" ariline
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%F'
