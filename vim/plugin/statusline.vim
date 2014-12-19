"============================================================================
"     FileName: statusline.vim
"       Author: Huoty
"        Email: loveqing2013@foxmail.com
"    TencentQQ: 1346632121
"     HomePage: http://loveqing2013.blog.163.com/
"      Version: 0.0.1
"   CreateDate: 2014-04-04 22:23:04
"      History: 
"  Description: 状态栏插件，用于配置一个华丽的状态栏
"============================================================================

set laststatus=2
set statusline=
set statusline+=%5*\[%n]                                    "缓冲区编号
set statusline+=%4*\ %<%F\                                  "文件路径
set statusline+=%1*\ %{&ff}\                                "文件系统
set statusline+=%6*\ %Y\                                    "文件类型 
set statusline+=%3*\ %{&fenc!=''?&fenc:&enc}\               "编码方式
set statusline+=%4*\ %l/%c\                                 "光标所在行列
set statusline+=%2*\ +%p%%\                                 "百分比
set statusline+=%1*\ %-16{strftime(\"%Y-%m-%d\ %H:%M\")}\   "日期与时间
set statusline+=%5*\[H]                                     "HUOTY

hi User1 ctermfg=white  ctermbg=darkred cterm=italic
hi User2 ctermfg=blue  ctermbg=58 cterm=italic
hi User3 ctermfg=green ctermbg=blue cterm=italic
hi User4 ctermfg=darkcyan  ctermbg=95 cterm=italic
hi User5 ctermfg=yellow  ctermbg=138 cterm=italic
hi User6 ctermfg=brown  ctermbg=95 cterm=italic
