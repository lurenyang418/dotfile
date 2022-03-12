set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,latin1
set termencoding=utf-8
set encoding=utf-8

" 语法高亮
syntax on
" 深色背景
color evening
" 检测文件类型
filetype on
" 根据文件类型加载对应的插件
filetype plugin on

" 显示行号
set number
" 相对行号
" set relativenumber
" 高亮显示当前行
" set cursorline

" 设置各种缩进
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
" tab转换为空格
set expandtab

set nobackup
set noswapfile
set nowritebackup
set noundofile

" faster
nnoremap < <<
nnoremap > >>

if empty(glob('~/.config/nvim/autoload/plug.vim'))
	!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync
endif


call plug#begin("~/.config/nvim/autoload")
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
" 补全
Plug 'jayli/vim-easycomplete'
" 终端
Plug 'skywind3000/vim-terminal-help'
" 高亮 yy
Plug 'machakann/vim-highlightedyank'
call plug#end()

" 按下 F2 调出/隐藏 NERDTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" global config
let g:easycomplete_scheme="sharp"
