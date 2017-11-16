" Plugin Settings ----------------- {{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" ===== Essentail =====
  Plug 'scrooloose/nerdtree'
  Plug 'mileszs/ack.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ctrlpvim/ctrlp.vim'
  "https://github.com/JazzCore/ctrlp-cmatcher
  Plug 'JazzCore/ctrlp-cmatcher'
  Plug 'easymotion/vim-easymotion'

" ===== Looking =====
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mhinz/vim-startify'

" ===== Utils =====
" https://github.com/CodeFalling/fcitx-vim-osx
  Plug 'CodeFalling/fcitx-vim-osx'
  Plug 'rizzatti/dash.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ervandew/supertab'
  " Plug 'tpope/vim-endwise'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " Plug 'wellle/targets.vim'
  " Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'junegunn/vim-easy-align'
  " https://sjl.bitbucket.io/gundo.vim/
  Plug 'sjl/gundo.vim'

" ===== Language =====
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }
  Plug 'w0rp/ale'


" Initialize plugin system
call plug#end()
" }}}

" Python Provider Settings ----------------- {{{
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'
" }}}

" Editor Settings ----------------- {{{

set guifont=Fira\ Mono\ for\ Powerline:h14
set bs=indent,eol,start " Allow backspacing over everything in insert mode
set tabstop=2           " number of spaces a tab counts for
set shiftwidth=2        " spaces of autoindents
set expandtab           " turn a tab into spaces
set smarttab            " smart tabl handling for indenting
set smartindent         " smart auto indent
set ruler               " show the cursor position
set number              " show line number
set relativenumber      " use relative number
set cursorline          " highlight current line
set laststatus=2        " always show status line
set mouse=a
set smartcase           " but become case sensitive if you type uppercase characters
set ignorecase          " searches are case insentitve
set showmatch           " Show matching brackets

set list
set listchars=extends:❯,precedes:❮,trail:·,extends:>,tab:▸\ ,eol:¬

" Only shown when not in insert mode so I don't go insane.
"augroup trailing
  "au!
  "au InsertEnter * :set listchars-=trail:⌴
  "au InsertLeave * :set listchars+=trail:⌴
"augroup END

set showbreak=↪
set t_Co=256


" Backups
set backup
set noswapfile

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

" Resize splits when the window is resized
au VimResized * :wincmd =

""" Wild Complete
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=tags
set wildignore+=*/tmp/*
set wildignore+=*/vendor/*
set wildignore+=*/node_modules/*
set wildignore+=*/spec/vcr/*
set wildignore+=*/public/*
set wildignore+=*/chef/*
set wildignore+=*/coverage/*
set wildignore+=*/vcr_cassettes/*
set wildignore+=*.png,*.jpg,*.otf,*.woff,*.jpeg,*.orig

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/node_modules/**/* " node_modules

" exclude some bobcat files
set wildignore+=*/build/*
set wildignore+=*/wx-build/*
set wildignore+=*/bower_components/*
set wildignore+=*/tmp/*
set wildignore+=*/bobcat-api/app/assets/javascripts/v4/*
set wildignore+=*/app/assets/javascripts/v4/*
set wildignore+=*/bobcat-fe/js/vendor/*
set wildignore+=*/.cache-loader/*

""" highlight trailing space and remove them when save
scriptencoding utf-8
set encoding=utf-8
" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()


" }}}

" Key Binding  ----------------- {{{

" Avoid ESC
inoremap jk <esc>
cnoremap jk <C-c>
" <esc> => go back to normal mode (in terminal mode)
tnoremap <Esc> <C-\><C-n>
" Switch functionality
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :
nnoremap 0 ^
nnoremap ^ 0
" copy to line end
nnoremap Y y$
" Navigation between panes
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

""" traverse change list
:nnoremap g; g;zz
:nnoremap g, g,zz
""" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
" prevent undo when visual mode
vnoremap u y
vnoremap gu u
" Make HOME and END behave like shell
inoremap <C-E> <End>
inoremap <C-A> <Home>

" https://coderwall.com/p/faceag/format-json-in-vim
nmap =j :%!python -m json.tool<CR>

" Leader expand
:let mapleader = " "

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

""" tab navigation
:nnoremap <leader>T :tabnew<cr>
:nnoremap <leader>K :tabclose<cr>
:nnoremap <leader>N :tabnext<cr>
:nnoremap <leader>P :tabprevious<cr>

" buffer naviagtion
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>

" add a new line according to the line below
:nnoremap <leader>o jO<esc>

""" spilit window
:nnoremap <leader>ws :split<cr>
:nnoremap <leader>wv :vsplit<cr>
""" buffer delete
:nnoremap <leader>kk :bdelete<cr>
""" Auto quote a word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
""" Auto single quote
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
""" copy file path
"copies just the filename.
nnoremap <leader>ps :let @*=expand("%")<CR>
"copies the filename including its full path.
nnoremap <leader>pl :let @*=expand("%:p")<CR>

" }}}

" Filetype Settings ---------------------- {{{
autocmd BufNewFile,BufRead *.es6,*.coffee set filetype=javascript
autocmd BufNewFile,BufRead *.wxml set filetype=html
" }}}

" Abbreviation Settings ---------------------- {{{
:iabbrev adn and
:iabbrev waht what
:iabbrev sytle style
:iabbrev consle console
:iabbrev destory destroy
" }}}

""" colorschema ---------------------- {{{
colorscheme gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set background=dark
set background=light
" }}}

" NERDTree Settings ---------------------- {{{

autocmd StdinReadPre * let s:std_in=1
""" open a NERDTree automatically when vim starts up if no files were specified
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""" open NERDTree automatically when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
""" close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Nerd tree setting
let NERDTreeShowBookmarks=1
let NERDTreeHighlightCursorline = 1
let NERDTreeCascadeOpenSingleChildDir = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen=1

""" shortcut to open NERDTree
nnoremap <leader>b :NERDTreeToggle<CR>
nnoremap <leader>l :NERDTreeFind<CR>
nnoremap <leader>B :NERDTreeFromBookmark<Space>
" }}}

" CtrlP Settings ---------------------- {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:100'
" Cache
"let g:ctrlp_cache_dir = $HOME . './cache/ctrlp'
"let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_use_caching = 0
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .DS_Store
        \ --ignore tmp
        \ --ignore images
        \ --ignore vendor
        \ --ignore vcr
        \ --ignore "tags"
        \ --ignore vcr_cassettes
        \ --ignore "**/*.(png|jpeg|jpg|gif|bmp)"
        \ -g ""'
endif
" use cmatch extension to speed up
" note: it does not work on regex mode
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
" switch the clear cache and toggle regex shortcut
let g:ctrlp_prompt_mappings = {
  \ 'ToggleRegex()':        ['<F5>'],
  \ 'PrtClearCache()':      ['<c-r>'],
  \ }
let g:ctrlp_cmd = ':NERDTreeClose\|CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|jpg|png|jpeg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" }}}

" Ack Settings ---------------------- {{{
nnoremap <leader>a :Ack!<space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}

" Dash Settings ---------------------- {{{
nnoremap <leader>dd :Dash<Cr>
" }}}

" Deoplete Settings ---------------------- {{{
let g:deoplete#enable_at_startup = 1
" }}}

" Airline Settings ---------------------- {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme= 'qwq'
" }}}

" SuperTab Settings ---------------------- {{{
" let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
" }}}

" Easy Align Settings ---------------------- {{{
xmap ga <Plug>(LiveEasyAlign)
nmap ga <Plug>(LiveEasyAlign)
" }}}

" Gundo Settings ---------------------- {{{
nnoremap <leader>u :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 1
" }}}
