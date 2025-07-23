" 中文支持
set fileencoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,latin1
set termencoding=utf-8
set encoding=utf-8

" 语法高亮
syntax on
" 检测文件类型
filetype on
" 根据文件类型加载对应的插件
filetype plugin on
" 搜索时忽略大小写（除非包含大写字母）
set ignorecase
set smartcase

" 设置制表符为4个空格
set tabstop=4
set shiftwidth=4
set expandtab

" 自动缩进
set autoindent
set smartindent

" 关闭交换文件（避免生成.swp文件）
set nobackup
set noswapfile
set nowritebackup
set noundofile

" faster
nnoremap < <<
nnoremap > >>