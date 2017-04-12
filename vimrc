"============================================================================
"     FileName: .vimrc
"       Author: Huoty
"        Email: sudohuoty@163.com
"     HomePage: http://www.konghy.cn/
"      Version: 7.0.1
"   CreateDate: 2012-12-16 20:19:03
"      History: huoty  2014-02-28  6.6.1  添加了一些插件
"               huoty  2014-11-29  6.7.1  添加DoxygenToolkit插件
"               huoty  2014-11-30  6.8.1  添加ConqueTerm插件
"               huoty  2014-12-06  6.9.1  添加括号和引号自动跳转功能
"               huoty  2015-07-16  6.9.9  更改状态栏并添加LargFile等插件
"               huoty  2015-08-06  7.0.0  添加Python语法检测插件pyflakes
"               huoty  2016-07-07  7.0.1  新建 shell 脚本时载入一个模板
"  Description: Linux 下 vim 用户自定义配置文件。
"============================================================================


"********************************************************************
" 判断当前系统类型 --------------------------------------------------
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif
"------------------------------------------------- end --------------


"********************************************************************
" 打开文件时的一些有用设置 ------------------------------------------
if has("autocmd")
    filetype plugin indent on "根据文件进行缩进
    augroup vimrcEx
        au!
        "在一行长于 78 个字符的时候自动换行，但仅对纯文本文件中有效，
        "即文件类型为text时
        autocmd FileType text setlocal textwidth=78
        "实现打开同一文件时，vim能够自动记住上一次的位置
        autocmd BufReadPost *
                  \ if line("'\"") > 0 && line("'\"") <= line("$") |
                  \ exe "normal g`\"" |
                  \ endif
    augroup END
else
    set autoindent
    always set autoindenting on
    "智能缩进，相应的有cindent，官方说autoindent可以支持各种文件的缩进，
    "但是效果会比只支持C/C++的cindent效果会差一点，但笔者并没有看出来
endif " has("autocmd")
"------------------------------------------------- end --------------

"********************************************************************
" 允许鼠标的使用 ----------------------------------------------------
if(g:iswindows==1)
    if has('mouse')
        set mouse=a
        set selection=exclusive
        set selectmode=mouse,key
    endif
    au GUIEnter * simalt ~x
endif
"------------------------------------------------- end --------------


" 不要vim模仿vi模式，建议设置，否则会有很多不兼容的问题
set nocompatible

" 不自动换行
set nowrap

" 高亮显示结果
set hlsearch

" 在输入要搜索的文字时，vim会实时匹配
set incsearch

" 在编辑过程中，在右下角显示光标位置的状态行
set ruler
set rulerformat=%35(%2*%<%f%=\ %m%r\ %3l\,%c\ \ \ \ %p%%%)

" 总是显示状态行
"set laststatus=2

" 在 Vim 窗口右下角，标尺的右边显示未完成的命令
set showcmd

" 将当前编辑文件的路径设置为当前路径:
set autochdir

" 可用来改动补全时采用的方式
set wildmode=list:full

" 显示文本处理模式:
set showmode

" 处理未保存或者只读文件时，给出提示:
set confirm

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 英文单词在换行时不被截断
set linebreak

" 与windows共享剪贴板
set clipboard+=unnamed

" 保存全局变量
set viminfo+=!

" 高亮当前行
"set cursorline

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile * setfiletype text

" 命令模式时可以显示输入的字符，但是设置此项后vim无法复制
"source $VIMRUNTIME/vimrc_example.vim


" 快捷打开编辑vimrc文件的键盘绑定==============================
" 命令模式输入\ee打开.vimrc文件
map <silent> <leader>ee :e $HOME/.vimrc<cr>
autocmd! bufwritepost *.vimrc source $HOME/.vimrc


"置粘贴模式====================================================
" 这样粘贴过来的程序代码就不会错位了,但是开启之后快速补全不能用
"set paste
"快捷键映射：
"map <F10> :set paste<CR>
"map <F11> :set nopaste<CR>
set pastetoggle=<F9>


"Tab设置====================================================
set sw=4  "缩进尺寸为 4 个空格
set ts=4  "Tab 宽度为 4 个字符
set et    "编辑时将所有 Tab 替换为空格
set smarttab  "只按一下 Backspace 就删除 4 个空格


"基本设置=====================================================
"set spell "打开拼写检查
syntax on "打开高亮
set number "显示行号
"set history=50  "命令的历史条数
set nobackup
filetype on                "侦测文件类型插件
filetype plugin on         "载入文件类型插件
filetype plugin indent on  "为特定文件类型载入相关缩进文件
set wildmenu
"使用 Tab 自动补全的时候,将补全内容使用一个漂亮的单行菜单形式显示出来


"修改自动补全列表背景颜色======================================
highlight Pmenu    term=bold cterm=bold ctermfg=8
highlight PmenuSel term=bold cterm=bold ctermfg=8


"C/C++部分配置=================================================
set sm "显示括号配对情况
set cin "打开 C/C++ 风格的自动缩进
set cino=:0g0t0(sus "设定 C/C++ 风格自动缩进的选项


"启用代码折叠用空格键来开关折叠=======================================
set foldenable            " 打开代码折叠
set foldmethod=syntax     " 选择代码折叠类型
set foldlevel=100         " 禁止自动折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>
                          "用空格键来开关折叠


"=====================================================================
" Platform dependent settings
"=====================================================================

if (has("win32"))

    "-----------------------------------------------------------------
    " Win32
    "-----------------------------------------------------------------

    if (has("gui_running"))
        set guifont=Monaco:h12:cANSI
        set guifontwide=幼圆:h12:cGB2312
    endif

else

    if (has("gui_running"))
        set guifont=Monaco\ 12
        set guifontwide=幼圆\ 12
    endif

endif

"字体设置相关----------------------------------------------------------
if (has("gui_running"))
" 图形界面下的设置
     set nowrap
     set guioptions+=b
     colo torte
else
" 字符界面下的设置
     set wrap
     colo ron
endif
"------------------------------------------------- end ----------------


"======================================================================
 "          * 解决打开文件中文乱码的问题 *
 "          * * * * * * * * * * * * * * **
 "<1>encoding: Vim 内部使用的字符编码方式，包括 Vim 的 buffer (缓冲区)、
 "   菜单文本、消息文本等。用户手册上建议只在 .vimrc 中改变它的值，事实
 "   上似乎也只有在 .vimrc 中改变它的值才有意义。

 "<2>fileencoding: Vim 中当前编辑的文件的字符编码方式，Vim 保存文件时也
 "   会将文件保存为这种字符编码方式 (不管是否新文件都如此)。

 "<3>fileencodings: Vim 启动时会按照它所列出的字符编码方式逐一探测即将打
 "   开的文件的字符编码方式，并且将 fileencoding 设置为最终探测到的字符
 "   编码方式。因此最好将 Unicode 编码方式放到这个列表的最前面，将拉丁语
 "   系编码方式 latin1 放到最后面。
 "=====================================================================
   set fileencodings=utf-8,gb2312,gbk,gb18030,ucs-bom,cp936,big5,euc-jp,euc-kr,latin1
   set fileencoding=utf-8
   set termencoding=utf-8
"----------------------------------------------------------------------


"==========================================================================
"开始编辑一个文件时读入一个骨架（样板）文件：
"==========================================================================
autocmd BufNewFile *.c     0r  ~/.vim/skeleton/skeleton.c
autocmd BufNewFile *.cpp   0r  ~/.vim/skeleton/skeleton.cpp
autocmd BufNewFile *.h     0r  ~/.vim/skeleton/skeleton.h
autocmd BufNewFile *.java  0r  ~/.vim/skeleton/skeleton.java
autocmd BufNewFile *.html  0r  ~/.vim/skeleton/skeleton.html
autocmd BufNewFile Makefile  0r  ~/.vim/skeleton/Makefile
"------------------------------------------------ end ---------------------


"==========================================================================
"输入括号和引号自动跳到中间
"==========================================================================
imap () ()<ESC>i
imap [] []<ESC>i
imap {} {}<ESC>i
imap "" ""<ESC>i
imap '' ''<ESC>i
imap <> <><ESC>i
"imap { {}<ESC>i<CR><ESC>V<O

"set smartindent
"set tabstop=4
"set shiftwidth=4
"set expandtab


"==========================================================================
"新建 shell 脚本文件时，自动添加文件头
"==========================================================================
function HeaderShell()
    call setline(1, "#! /bin/bash")
    call append(1, "")
    call append(2, "# Filename: " . expand('%:t') . " " . strftime('%Y-%m-%d', localtime()))
    call append(3, "# Author: Huoty <sudohuoty@gmail.com>")
    call append(4, "# Script starts from here:")
    normal G
    normal o
    normal o
endf

autocmd bufnewfile *.sh call HeaderShell()


"==========================================================================
"新建python文件时，自动添加文件头
"==========================================================================
function HeaderPython()
    call setline(1, "#! /usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    call append(2, "")
    call append(3, "# *************************************************************")
    call append(4, "#  Copyright (c) Huoty - All rights reserved")
    call append(5, "#")
    call append(6, "#      Author: Huoty <sudohuoty@gmail.com>")
    call append(7, "#  CreateTime: " . strftime('%Y-%m-%d %T', localtime()))
    call append(8, "# *************************************************************")
    call append(9, "")
    call append(10, "")
    call append(11, "")
    call append(12, "# Script starts from here")
    normal G
    normal o
    normal o
endf

autocmd bufnewfile *.py call HeaderPython()
"------------------------------------------------ end ---------------------


"==========================================================================
"新建PHP文件时，自动添加文件头
"==========================================================================
function HeaderPHP()
    call setline(1, "<?php  # Script -- " . expand("%:t"))
    call append(1, "")
    call append(2, "/* Author @ Huoty")
    call append(3, " *   Date @ " . strftime('%Y-%m-%d %T', localtime()))
    call append(4, " *  Brief @ ")
    call append(5, " */")
    call append(6, "")
    call append(7, "?>")
    normal G
    normal O
    normal O
endf

autocmd bufnewfile *.php call HeaderPHP()
"------------------------------------------------ end ---------------------


"======================== ctags插件 =======================================
"设置tags文件的生成、更新和删除，以映射快捷键
"==========================================================================
"F2生成/更新tags文件
set tags=tags;
set autochdir
function! UpdateTagsFile()
    silent !ctags -R --fields=+ianS --extra=+q
endfunction
nmap <F2> :call UpdateTagsFile()<CR>

"Ctrl + F2删除tags文件
function! DeleteTagsFile()
    "Linux下的删除方法
    "silent !rm tags
    "Windows下的删除方法
    silent !del /F /Q tags
endfunction
nmap <C-F2> :call DeleteTagsFile()<CR>
"退出VIM之前删除tags文件
"au VimLeavePre * call DeleteTagsFile()

"加入搜索路径：
set tags=/usr/include/tags
"------------------------------------------------ end ---------------------


"========================= 窗口管理插件 ===================================
"窗口管理工具
"==========================================================================
"Tag List 显示函数列表
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"winmanager 文件浏览器
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWidth = 30  " 设置宽度
nmap wm :WMToggle<cr>

"NERDtree 显示目录树
nmap nt :NERDTree<cr>


"======================== AuthorInfo插件 ==================================
"快速添加作者信息
"==========================================================================
let g:vimrc_author='Huoty'
let g:vimrc_email='sudohuoty@163.com'
let g:vimrc_homepage='http://konghy.blog.163.com/'
" 映射到快捷键<F8>:
nmap <F8> :AuthorInfoDetect<cr>
"------------------------------------------------ end ---------------------


"====================== DoxygenToolkit插件 ================================
"自动添加各类注释
"==========================================================================
" Usage: Dox       添加函数注释
"        DoxLic    添加许可注释
"        DoxAuthor 文件头注释

let g:DoxygenToolkit_authorName="Huoty, sudohuoty@163.com"
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns "
"let g:DoxygenToolkit_blockHeader="---------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="---------------------------------------------------"
let g:DoxygenToolkit_licenseTag="GPL"

let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1


"======================= NERD_commenter插件 ===============================
"NERD_commenter设定快捷键:  其中F3为"注释"，F4为""取消注释"
"==========================================================================
map <F3> <leader>cc
map <F4> <leader>cu
"------------------------------------------------ end ---------------------


"======================= VIM-POWERLINE插件 ===============================
" 状态栏插件配置
"==========================================================================
set laststatus=2
set t_Co=8
let g:Powerline_symbols='unicode'
set encoding=utf8

"===================3======= LargFile插件 =================================
" 用于打开大文件
"==========================================================================
let g:LargeFile=5 "设置打开最大文件的标准为5M


"================================================================
"          indentLine 插件配置
"================================================================
" 用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
" 在终端上会有屏幕刷新的问题，这个问题能解决有更好了
" 开启/关闭对齐线
nmap <leader>il :IndentLinesToggle<CR>

" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
let g:indentLine_color_term = 2

" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
"  let g:indentLine_color_gui = '#A4E57E'

"==========================================================================
"                ## C和C++的编译和运行 ##
"
" 快捷键映射：
"             <F5>：编译
"             <F6>：运行
"
"==========================================================================
func! CompileGcc()
    exec "w"
    let compilecmd="!gcc "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! CompileGpp()
    exec "w"
    let compilecmd="!g++ "
    let compileflag="-o %< "
    if search("mpi\.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut\.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv\.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp\.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math\.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc

func! RunPython()
        exec "!python %"
endfunc
func! CompileJava()
    exec "!javac %"
endfunc


func! CompileCode()
        exec "w"
        if &filetype == "cpp"
                exec "call CompileGpp()"
        elseif &filetype == "c"
                exec "call CompileGcc()"
        elseif &filetype == "python"
                exec "call RunPython()"
        elseif &filetype == "java"
                exec "call CompileJava()"
        endif
endfunc

func! RunResult()
        exec "w"
        if search("mpi\.h") != 0
            exec "!mpirun -np 4 ./%<"
        elseif &filetype == "cpp"
            exec "! ./%<"
        elseif &filetype == "c"
            exec "! ./%<"
        elseif &filetype == "python"
            exec "call RunPython"
        elseif &filetype == "java"
            exec "!java %<"
        endif
endfunc

map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>

map <F6> :call RunResult()<CR>
"------------------------------------------------ end ---------------------

