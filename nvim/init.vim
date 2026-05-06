" 基础行为
set nocompatible
syntax enable
filetype plugin indent on

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,big5
set autoread
set hidden
set confirm

" 显示与布局
set number
set cursorline
set showmatch
set laststatus=2
set scrolloff=4
set signcolumn=yes

" 搜索高亮
set ignorecase
set smartcase
set hlsearch
set incsearch

" tab / 缩进习惯
set expandtab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

" 折叠习惯
set foldenable
set foldmethod=indent
set foldlevelstart=99

" macOS 剪贴板
set clipboard=unnamed

" 文件类型缩进
autocmd FileType php,python,c,cpp,java,perl,sh,bash,vim,ruby,go setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType javascript,typescript,html,css,xml,json,yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" 主题：优先 molokai，没有就 fallback
try
  colorscheme molokai
  let g:molokai_original = 1
catch
  colorscheme default
endtry

" 插件：建议用 vim-plug，保留你真实还会用到的
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'raimondi/delimitmate'

call plug#end()

" NERDTree：保留 tree 习惯
map <C-n> :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | endif

" 窗口 / 布局改键
nmap mm <C-w>_
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 空格开关折叠
nnoremap <Space> za

" 清理格式
nmap cS :%s/\s\+$//g<CR>:nohlsearch<CR>
nmap cM :%s/\r$//g<CR>:nohlsearch<CR>

" 插入模式 Ctrl-hjkl 移动光标
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" EasyAlign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Autoformat
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
