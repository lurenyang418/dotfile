" 中文支持
set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,latin1

" 语法高亮
syntax on
" 检测文件类型
filetype on
" 根据文件类型加载对应的插件
filetype plugin on

" 搜索设置
set ignorecase
set smartcase
set hlsearch
set incsearch

" 缩进设置
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" 显示设置
set number
set relativenumber
set wrap
set showcmd
set wildmenu

" 性能优化
set lazyredraw
set updatetime=300

" 关闭交换文件
set nobackup
set noswapfile
set nowritebackup
set noundofile

" 快速缩进
nnoremap < <<
nnoremap > >>
