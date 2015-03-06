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
    \ 'vimshell' : '~/.vimshell_hist',
    \ 'scheme' : '~/.gosh_completions',
    \ 'css' : '~/.vim/bundle/dict/css3.dict',
    \ 'javascript' : '~/.vim/bundle/dict/javascript.dic'
    \ }
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
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

" auto pair close tags
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf
function CloseBracket()
  if match(getline(line('.') + 1), '\s*}') < 0
    return "\<CR>}"
  else
    return "\<Esc>j0f}a"
  endif
endf
function QuoteDelim(char)
  let line = getline('.')
  let col = col('.')
  if line[col - 2] == "\\"
    "Inserting a quoted quotation mark into the string
    return a:char
  elseif line[col - 1] == a:char
   "Escaping out of the string
   return "\<Right>"
  else
    "Starting a string
    return a:char.a:char."\<Esc>i"
  endif
endf
