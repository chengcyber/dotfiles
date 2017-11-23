" type "za" for fold and unfold

" Vundle Settings  ---------------------- {{{
" required
set nocompatible        " be improved required
filetype off            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
""""""""""""""""""""""""""""""

"""==== Essential ====
" Need compile, see https://github.com/Valloric/YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
" Need compile, see https://github.com/JazzCore/ctrlp-cmatcher
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'mileszs/ack.vim'
Plugin 'easymotion/vim-easymotion'

"""==== Productivity ====
Plugin 'haya14busa/incsearch.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'jreybert/vimagit'
Plugin 'tomtom/tcomment_vim'
" Navigate tag file
" https://github.com/maxbrunsfeld/vim-config/blob/master/ctags
" https://stackoverflow.com/questions/4777366/recommended-vim-plugins-for-javascript-coding/5893600#5893600
" npm install -g git+https://github.com/ramitos/jsctags.git
Plugin 'majutsushi/tagbar'

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rizzatti/dash.vim'

"""==== Syntax Support ====
Plugin 'leafgarland/typescript-vim'
Plugin 'reasonml-editor/vim-reason'

"""==== UI ====
" Color Schemes
" :colorshceme <space> <C-d> display all color available
"Plugin 'bluz71/vim-moonfly-colors'
"Plugin 'kudabux/vim-srcery-drk'
"Plugin 'sonph/onehalf', {'rtp': 'vim/'}
"Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'

""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" Editor Settings ---------------------- {{{
set macligatures
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

set list
set listchars=extends:❯,precedes:❮,trail:·,extends:>,tab:▸\ ,eol:¬
set showbreak=↪
set t_Co=256

" solve performance issue with iterm2
set ttyfast
set lazyredraw

" https://coderwall.com/p/faceag/format-json-in-vim
nmap =j :%!python -m json.tool<CR>

" Backups
set backup
set noswapfile

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

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

""" Fold Settings
" set nofoldenable
" set foldmethod=indent
" set foldnestmax=10
" set foldcolumn=0
" setlocal foldlevel=2
" set foldclose=all

" Auto Save when losing focus
"au FocusLost * :silent! wall

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
" }}}

" Search Settings ---------------------- {{{
set hlsearch            " highlight matches
set incsearch           " highlight dynamically as pattern is typed
set smartcase           " but become case sensitive if you type uppercase characters
set ignorecase          " searches are case insentitve
" }}}

" FileType Settings ---------------------- {{{

autocmd BufNewFile,BufRead *.es6,*.coffee set filetype=javascript
autocmd BufNewFile,BufRead *.wxml set filetype=html

"}}}

" Folder Settings ---------------------- {{{
autocmd FileType vim,c++,txt setlocal foldmethod=marker
" }}}

" Key Mapping Settings ---------------------- {{{
:let mapleader = " "

" Normal Mode Mapping
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>
""" quti and close current buff
":nnoremap K :quit<cr>
""" add a blank line above
:nnoremap <leader>o O<esc>j
""" spilit window
:nnoremap <leader>S :split<cr>
:nnoremap <leader>V :vsplit<cr>
""" traverse change list
:nnoremap g; g;zz
:nnoremap g, g,zz
""" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
""" tab
:nnoremap <leader>T :tabnew<cr>
:nnoremap <leader>K :tabclose<cr>
:nnoremap <leader>N :tabnext<cr>
:nnoremap <leader>P :tabprevious<cr>
""" buffer delete
:nnoremap <leader>kk :bdelete<cr>
""" Quickfix
nnoremap <c-q> :copen<cr>
""" Auto quote a word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
""" Auto single quote
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
""" grep
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
""" copy file path
"copies just the filename.
nnoremap <leader>cs :let @*=expand("%")<CR>
"copies the filename including its full path.
nnoremap <leader>cl :let @*=expand("%:p")<CR>

" Avoid ESC
inoremap jk <esc>
cnoremap jk <C-c>

" Switch functionality
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :
nnoremap 0 ^
nnoremap ^ 0

" Operator Pending Mapping
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il} :<c-u>normal! F}vi{<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
onoremap il' :<c-u>normal! F'vi'<cr>

" Navigation between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" }}}

" Abbreviation Settings ---------------------- {{{
:iabbrev adn and
:iabbrev waht what
:iabbrev sytle style
:iabbrev consle console
:iabbrev destory destroy
" }}}

" YouCompleteMe Settings ---------------------- {{{
""" remove default TAB to solve conflict with UltiSnips
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" }}}

" Nerdtree Settings ---------------------- {{{

autocmd StdinReadPre * let s:std_in=1
""" open a NERDTree automatically when vim starts up if no files were specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""" open NERDTree automatically when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
""" close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Nerd tree setting
let NERDTreeShowBookmarks=1
let NERDTreeHighlightCursorline = 1
let NERDTreeCascadeOpenSingleChildDir = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDChristmasTree = 1
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen=1

" Key mapping
""" shortcut to open NERDTree
noremap <D-d> :NERDTreeToggle<CR>
nnoremap <leader>l :NERDTreeFind<CR>
nnoremap <leader>B :NERDTreeFromBookmark<Space>

""" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" }}}

" CtrlP Settings ---------------------- {{{
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
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
" Close NERDTree window
"let g:ctrlp_dont_split = 'NERD_tree_1'
" open files via CtrlP only in writable buffer
"function! CtrlPCommand()
"  let c = 0
"  let wincount = winnr('$')
"  " Don't open it here if current buffer is not writable (e.g. NERDTREE)
"  while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
"    exec 'wincmd w'
"    let c = c + 1
"  endwhile
"  exec 'CtrlP'
"endfunction
" let g:ctrlp_cmd = 'call CtrlPCommand()'
let g:ctrlp_cmd = ':NERDTreeClose\|CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|jpg|png|jpeg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" }}}

" Airline Settings ---------------------- {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
" }}}

" EasyMotion Settings ---------------------- {{{
":map <localleader> <Plug>(easymotion-prefix)
" Disable default mappings
"let g:EasyMotion_do_mapping = 0
:let g:EasyMotion_smartcase = 1
"nnoremap s <Plug>(easymotion-overwin-f2)
:nmap f <Plug>(easymotion-s)
:vmap f <Plug>(easymotion-s)
":map / <Plug>(easymotion-sn)
":omap / <Plug>(easymotion-tn)

" }}}

" Emmet Settings ---------------------- {{{
let g:user_emmet_leader_key='<c-e>'
" let g:user_emmet_install_global=0
" autocmd FileType html,css EmmetInstall
" }}}

" Ack Settings ---------------------- {{{
nnoremap <leader>a :Ack!<space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" }}}

" UltiSnips Settings ---------------------- {{{
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }}}

" Indent-Guide Settings ---------------------- {{{
:let g:indent_guides_enable_on_vim_startup = 1
" }}}

" Incsearch Settings ---------------------- {{{
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

function! s:noregexp(pattern) abort
  return '\V' . escape(a:pattern, '\')
endfunction

function! s:config() abort
  return {'converters': [function('s:noregexp')]}
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config())
" }}}

" Tabular Settings ---------------------- {{{
if exists(":Tabularize")
  nmap <leader>A :Tabularize<space>/
"  nmap <Leader>a= :Tabularize /=<CR>
"  vmap <Leader>a= :Tabularize /=<CR>
"  nmap <Leader>a: :Tabularize /:\zs<CR>
"  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" }}}

" TagBar Settings ---------------------- {{{
nnoremap <c-y> :TagbarToggle<CR>
" }}}

" Vim-Reason Settings ---------------------- {{{
autocmd FileType reason map <buffer> <D-M> :ReasonPrettyPrint<Cr>
" }}}

" Magit Settings ---------------------- {{{
nnoremap <leader>gg :Magit<CR>
" }}}

" Dash Settings ---------------------- {{{
nnoremap <leader>dd :Dash<Cr>
" }}}

" colorscheme theme Settings ---------------------- {{{
syntax on
" Color Scheme
silent! colorscheme gruvbox
let g:airline#extension#tabline#enabled=1
let g:airline_theme='gruvbox'

"syntax enable
"set background=light
"silent! colorscheme solarized
"
"if has('gui_running')
"    set background=light
"else
"    set background=dark
"endif

""" }}}
