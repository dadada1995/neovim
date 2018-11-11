"==========================================
"general setting
"==========================================
let mapleader = ','
let g:mapleader = ','
syntax on
filetype plugin indent on
set undolevels=100
set number
set tabstop=4 shiftwidth=4 expandtab ai
set autoindent
set winwidth=120

" word wrap
"autocmd FileType * setlocal columns=120


" 文件修改之后自动载入
set autoread
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI
" 突出显示当前列
"set cursorcolumn
" 突出显示当前行
set cursorline
" 显示当前的行号列号
set ruler

set showmode

" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" Smart indent
set smartindent
" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

""" 离开插入模式后自动关闭预览窗口
""autocmd InsertLeave * if pumvisible() == 0|pclose|endif
""" In the quickfix window, <CR> is used to jump to the error under the
""" cursor, so undefine the mapping there.
""autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
""" quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
""autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
""autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K
""
" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"==========================================
" HotKey Settings
"==========================================
" F2 行号开关，用于鼠标复制代码用
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>

" F5 paste
set pastetoggle=<F5>
" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

"Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Go to home and end using capitalized directions
noremap H ^
noremap L $
" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" tab切换
" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
" y$ -> Y Make Y behave like other capitals
map Y y$
"==========================================
" FileType Settings  文件类型设置
"==========================================
" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if(expand('%:e') == 'sh')
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if (expand('%:e') == 'py')
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
        call append(1, "\# -*- coding: utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc
"==========================================
" Terminal Settings
"==========================================
fu! OpenTerminal()
    " open split windows on the topleft
    botright split
    " resize the height of terminal windows to 30
    resize 13
    :terminal
endf
nnoremap <leader>t :call OpenTerminal()<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k

"==========================================
" Pluging Settings
"==========================================
source $HOME/.config/nvim/plug.vim
