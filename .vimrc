set shell=/bin/bash
" set the runtime path to include powerline
set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
"These lines setup the environment to show graphics and colors correctly.
set nocompatible
set t_Co=256
filetype off

let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/taglist.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/winmanager'
Plugin 'vim-scripts/a.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'moll/vim-bbye'
Plugin 'aperezdc/vim-template'
" All of your Plugins must be added before the following line
call vundle#end()            " required

"set encoding=utf-8
"set fileencoding=utf-8
"set fileencodings=utf-8
"set termencoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

setlocal cursorline
hi CursorLine   cterm=underline ctermbg=NONE ctermfg=darkgreen guibg=darkred guifg=white
"hi CursorLine   cterm=underline ctermbg=NONE
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

" 在有注释的下一行不再自动添加注释
au FileType * setl fo-=cro

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
  set autoindent " always set autoindenting on
endif

execute pathogen#infect()

if has("gui_running")
    "set guifont=verdana\ 12
    set guifont=Inconsolata\ for\ Powerline:h14
    set background=light
    colorscheme solarized
else
    "set guifont=Verdana\ 10
    set guifont=Inconsolata\ for\ Powerline:h14
    set background=dark
    "let g:solarized_termcolors=256
    colorscheme solarized
    "colorscheme peaksea
    "colorscheme 256-jungle
endif

if &diff  
    colors peaksea
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"开始模块化设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""
" leader键
"""""""""""""""""""""""""""""""
let mapleader=","
let g:mapleader=","

"""""""""""""""""""""""""""""""
"settings for taglist
" taglist设置
"""""""""""""""""""""""""""""""
let Tlist_Show_One_File=1 " 0为同时显示多个文件函数列表,1则只显示当前文件函数列表
let Tlist_Auto_Update=1
let Tlist_File_Fold_Auto_Close=1 " 非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "如果taglist是最后一个窗口，则退出vim 
let Tlist_Auto_Update=1            "Automatically update the taglist to include newly edited files.
"把taglist窗口放在屏幕的右侧，缺省在左侧
let Tlist_Use_Right_Window=1 
"显示taglist菜单
"let Tlist_Show_Menu=1
"启动vim自动打开taglist
"let Tlist_Auto_Open=1
" ctags, 指定tags文件的位置,让vim自动在当前或者上层文件夹中寻找tags文件
set tags=tags
" 添加系统调用路径
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
set tags+=/usr/include/tags
"键绑定，刷新tags
nmap tg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q *<CR>:set tags+=./tags<CR>
nmap tl :TlistToggle<CR>

"settings for minibuffer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 
"nmap bn :bn
"nmap bp :bp
"map <F3> :TMiniBufExplorer<CR>
"map me :TMiniBufExplorer<CR>
nmap cw <c-w><c-w>

"""""""""""""""""""""""""""""""
" WinManager设置
"""""""""""""""""""""""""""""""
" NERD_Tree集成到WinManager
let g:NERDTree_title="[NERDTree]" 

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

" 键盘映射，同时加入防止因winmanager和nerdtree冲突而导致空白页的语句
nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>
" 设置winmanager的宽度，默认为25
let g:winManagerWidth=30 
" 窗口布局
"let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWindowLayout='NERDTree'
" 如果所有编辑文件都关闭了，退出vim
let g:persistentBehaviour=0

map<c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-t> :WMToggle<cr> 

"""""""""""""""""""""""""""""""
" airline设置
"""""""""""""""""""""""""""""""
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap bp :bp<CR>
nnoremap bn :bn<CR>

"""""""""""""""""""""""""""""""
" Bbye设置
"""""""""""""""""""""""""""""""
" 由于原生的:bd在删除当前buffer时会将整个窗口关闭，故使用Bbye的:Bd
"nnoremap bd :Bd<CR>

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

autocmd BufNewFile *.sh 0r ~/.vim/template/bash/bash_template

"""""""""""""""""""""""""""""""
" TAGS
"""""""""""""""""""""""""""""""
"set tags=./tags,/home/xiaopan/tags

" nerdtree设置
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
let NERDTreeMouseMode=2
" 是否默认显示书签列表
let NERDTreeShowBookmarks=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示隐藏文件
" let NERDTreeShowHidden=1
" 是否默认显示行号
let NERDTreeShowLineNumbers=1
" 窗口位置（'left' or 'right'）
let NERDTreeWinPos='left'
" 窗口宽
let NERDTreeWinSize=31
let NERDChristmasTree=1
"nnoremap f :NERDTreeToggle

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
