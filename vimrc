" type "za" for fold and unfold

" Plug Settings  ---------------------- {{{

" Install Plug Script
let s:vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(s:vim_plug_path)
  echo 'Installing vim-plug...'
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  execute 'source ' . fnameescape(s:vim_plug_path)
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

""" Make sure you use single quotes

"""==== Essential ====
" Need compile, see https://github.com/Valloric/YouCompleteMe
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'scrooloose/nerdtree'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Need compile, see https://github.com/JazzCore/ctrlp-cmatcher
" Plugin 'JazzCore/ctrlp-cmatcher'
" Plug 'FelikZ/ctrlp-py-matcher'
" Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'

"""==== Productivity ====
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
" Plug 'jreybert/vimagit'
Plug 'tomtom/tcomment_vim'
" Navigate tag file
" https://github.com/maxbrunsfeld/vim-config/blob/master/ctags
" https://stackoverflow.com/questions/4777366/recommended-vim-plugins-for-javascript-coding/5893600#5893600
" npm install -g git+https://github.com/ramitos/jsctags.git
Plug 'majutsushi/tagbar'

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rizzatti/dash.vim'

"""==== Syntax Support ====
Plug 'leafgarland/typescript-vim'
Plug 'reasonml-editor/vim-reason'
Plug 'joegesualdo/jsdoc.vim'

"""==== Util ====
Plug 'CodeFalling/fcitx-vim-osx'
Plug 'junegunn/vim-easy-align'

"""==== UI ====
" Color Schemes
" :colorshceme <space> <C-d> display all color available
"Plugin 'bluz71/vim-moonfly-colors'
"Plugin 'kudabux/vim-srcery-drk'
"Plugin 'sonph/onehalf', {'rtp': 'vim/'}
"Plugin 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
" " Initialize plugin system
call plug#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugInstall    - installs plugins
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h plug for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" Editor Settings ---------------------- {{{
set macligatures
set guifont=monofur\ for\ Powerline:h18
" if system("osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ' ' -f 4") > 900
"   set guifont=Fira\ Mono\ for\ Powerline:h23
" else
"   set guifont=Fira\ Mono\ for\ Powerline:h14
" endif

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
nnoremap <leader>= :bn<cr>
nnoremap <leader>- :bp<cr>
:nnoremap <leader>kk :bdelete<cr>
""" Quickfix
nnoremap <c-q> :copen<cr>
""" Auto quote a word
" nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
""" Auto single quote
" nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
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

" copy to line end
nnoremap Y y$
" copy to system clipboard
noremap gy "+y
" copy whole file to system clipboard
nnoremap gY gg"+yG

vnoremap u y
vnoremap gu u
" Make HOME and END behave like shell
inoremap <C-E> <End>
inoremap <C-A> <Home>

" prevent entering ex mode accidentally
nnoremap Q <Nop>

" Tab/shift-tab to indent/outdent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

" Search for selected text
vnoremap * "xy/<C-R>x<CR>

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

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1

"" limit the ycmd open in these filetypes
let g:ycm_filetype_whitelist = {
      \   'sh': 1,
      \   'zsh': 1,
      \   'vim': 1,
      \   'c': 1,
      \   'cpp': 1,
      \   'python': 1,
      \   'javascript': 1,
      \   'typescript': 1,
      \   'go': 1,
      \   'java': 1,
      \ }
" enhance the default trigger
let g:ycm_semantic_triggers =  {
      \   'c': ['->', '.', 're!\w{3}'],
      \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 're!\[.*\]\s'],
      \   'ocaml': ['.', '#'],
      \   'cpp,cuda,objcpp': ['->', '.', '::', 're!\w{3}'],
      \   'perl': ['->'],
      \   'php': ['->', '::'],
      \   'ruby': ['.', '::'],
      \   'lua': ['.', ':'],
      \   'erlang': [':'],
      \   'vim': ['re![_a-zA-Z]+[_\w]*\.'],
      \   'sh,zsh': ['re![\w-]{2}', '/', '-'],
      \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.', 're!\w{3}'],
      \ }

" shortcuts
nnoremap <Leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>ji :YcmCompleter GoToInclude<CR>
nnoremap <Leader>jj :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>jr :YcmCompleter GoToReferences<CR>
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

" fzf Settings ---------------------- {{{
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* Gg
      \ call fzf#vim#grep(
      \   'git grep --line-number --color=always '.shellescape(<q-args>), 0,
      \   extend(
      \     {'dir': systemlist('git rev-parse --show-toplevel')[0]},
      \     <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   ), <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)


" Search History
nnoremap <Leader>/ :History/<CR>
" Command History
nnoremap <Leader>; :History:<CR>
" File History
nnoremap <expr> <Leader>' (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":History\<CR>"
" Search Content via current word
nnoremap <Leader>aa :Ag<Space><C-r><C-w><CR>
vnoremap <Leader>aa "gy:Ag<Space><C-r>g<CR>
" Search File
nnoremap <expr> <Leader>af (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":Files\<CR>"
" Commands
nnoremap <Leader>ac :Commands<CR>
" Windows
nnoremap <Leader>aw :Windows<CR>
" Sinnpets
nnoremap <Leader>au :Snippets<CR>

" Search Content with Git via current word
nnoremap <Leader>ga :Gg<Space><C-r><C-w><CR>
vnoremap <Leader>ga "gy:Gg<Space><C-r>g<CR>
" Search File
nnoremap <expr> <Leader>gg (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":GFiles\<CR>"
" Git Commits
nnoremap <Leader>gc :Commits<CR>

" Buffers
nnoremap <expr> <Leader>bb (expand('%') =~ 'NERD_tree' ? "\<C-w>\<C-w>" : '') . ":Buffers\<CR>"
nnoremap <Leader>bc :BCommits<CR>

" }}}

" CtrlP Settings ---------------------- {{{
" let g:ctrlp_map = '<c-p>'
" " let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = ''
" let g:ctrlp_max_depth = 40
" let g:ctrlp_max_files = 0
" let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:100'
" " Cache
" "let g:ctrlp_cache_dir = $HOME . './cache/ctrlp'
" "let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_use_caching = 0
" " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" if executable('ag')
"   " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor
"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"   let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
"         \ --ignore .git
"         \ --ignore .DS_Store
"         \ --ignore tmp
"         \ --ignore images
"         \ --ignore vendor
"         \ --ignore vcr
"         \ --ignore "tags"
"         \ --ignore vcr_cassettes
"         \ --ignore "**/*.(png|jpeg|jpg|gif|bmp)"
"         \ -g ""'
" endif
" " use cmatch extension to speed up
" " note: it does not work on regex mode
" " let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" " switch the clear cache and toggle regex shortcut
" let g:ctrlp_prompt_mappings = {
"   \ 'ToggleRegex()':        ['<F5>'],
"   \ 'PrtClearCache()':      ['<c-r>'],
"   \ }
" " Close NERDTree window
" "let g:ctrlp_dont_split = 'NERD_tree_1'
" " open files via CtrlP only in writable buffer
" "function! CtrlPCommand()
" "  let c = 0
" "  let wincount = winnr('$')
" "  " Don't open it here if current buffer is not writable (e.g. NERDTREE)
" "  while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
" "    exec 'wincmd w'
" "    let c = c + 1
" "  endwhile
" "  exec 'CtrlP'
" "endfunction
" " let g:ctrlp_cmd = 'call CtrlPCommand()'
" let g:ctrlp_cmd = ':NERDTreeClose\|CtrlP'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|jpg|png|jpeg)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }
" }}}

" Airline Settings ---------------------- {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_nr_type= 2
let g:airline#extensions#tabline#tabs_label = 'TABS'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9
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
" nnoremap <leader>a :Ack!<space>
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif
" }}}

" UltiSnips Settings ---------------------- {{{
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }}}

" Indent-Guide Settings ---------------------- {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
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
" nnoremap <leader>gg :Magit<CR>
" }}}

" Dash Settings ---------------------- {{{
nnoremap <leader>dd :Dash<Cr>
" }}}

" JSDoc Settings ---------------------- {{{
let g:jsdoc_tags = {
    \   'returns': 'return',
    \ }
autocmd BufNewFile,BufRead *.js,*.jsx nmap <silent> <LocalLeader>jsd <Plug>(jsdoc)
autocmd BufNewFile,BufRead *.ts,*.tsx nmap <silent> <LocalLeader>jsd <Plug>(jsdoc)
" }}}

" Easy Align Settings ---------------------- {{{
" xmap ga <Plug>(LiveEasyAlign)
" nmap ga <Plug>(LiveEasyAlign)
" }}}

" colorscheme theme Settings ---------------------- {{{
syntax on
set termguicolors
" Color Scheme
" silent! colorscheme gruvbox
silent! colorscheme dracula
let g:airline#extension#tabline#enabled=1
let g:airline_theme='qwq'
set background=dark
let g:gruvbox_italic=1

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
