"set encoding=utf-8                                                                                                                                       
"set fileencoding=utf-8
"set fileencodings=utf-8
"set termencoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix

set nocompatible
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

setlocal cursorline
hi CursorLine   cterm=underline ctermbg=NONE
hi CursorColumn cterm=NONE      ctermbg=darkcyan ctermfg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

set nocp
filetype plugin on
set history=20
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nobackup
set shiftwidth=4
set cinoptions=(0,:0
set expandtab
set uc=0        "do not use swap file when editing
set nu

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")
  filetype plugin indent on
  autocmd FileType text setlocal tabstop=4
  autocmd FileType sh setlocal tabstop=4
  autocmd FileType text setlocal textwidth=78
  autocmd FileType html setlocal shiftwidth=2
  autocmd FileType xml setlocal shiftwidth=2
else
  set autoindent		" always set autoindenting on
endif

execute pathogen#infect()

if has("gui_running")
    set guifont=Monaco\ 9
    colorscheme baycomb
else
    "colorscheme baycomb
    colorscheme 256-jungle
endif

"settings for taglist
nmap tl :TlistToggle<CR>
nnoremap <silent> <F5> :TlistToggle<CR>
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window=1

"settings for minibuffer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 
"nmap bn :bn
"nmap bp :bp
map <F3> :TMiniBufExplorer<CR>
map me :TMiniBufExplorer<CR>
nmap cw <c-w><c-w>

"winmanager
nmap wm :WMToggle<cr>
nnoremap <silent> <F2> :WMToggle<CR>

map<c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-t> :WMToggle<cr> 

"added for vimExplorer
"C-Tab for switching the files
"let g:VEConf_treeHotkey = {}
"let g:VEConf_treeHotkey.toggleNode = 'o'
"let g:VEConf_treeHotkey.switchPanel = '<s-tab>'
"let g:VEConf_fileHotkey = {}
"let g:VEConf_fileHotkey.switchPanel = '<s-tab>'
"
"nmap <C-TAB> <C-PageDown>
"nmap <C-S-TAB> <C-PageUp>

"settings for cscope
if has("cscope")
    set cst
endif

"autocmd BufNewFile *.sh 0r ~/.vim/template/bash/bash_template

"""""""""""""""""""""""""""""""
" TAGS
"""""""""""""""""""""""""""""""
"set tags=./tags,/home/xiaopan/tags

"NERD Tree
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
nnoremap f :NERDTreeToggle

"skip loading of this plugin.
"let g:templates_plugin_loaded = 1
"disable automatic insertion of template in new files.
"let g:templates_no_autocmd = 1

"autocmd BufWrite *.sh if getline(6) != "# Modify Author: ".expand("$SHTERM_REAL_USER@alibaba-inc.com") || split(getline(7))[3] != strftime("%F") | call ModifyTitle() | endif
"
"func ModifyTitle()
"    if getline(6) =~ "# Modify Author:.*"
"        call setline(6, "\# Modify Author: ".expand("$USER@alibaba-inc.com") )
"        call setline(7, "\# Modify Date: ".strftime("%F %R"))
"    endif
"endfunc
