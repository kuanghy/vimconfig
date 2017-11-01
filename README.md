VimConfig
=========

Unix 平台下的 vim 配置

## 精简版安装

安装插件管理器 [Vundle](https://github.com/VundleVim/Vundle.vim):

> $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

修改配置:

> cp vimrc-mini ~/.vimrc

打开 vim, 命令模式输出 `:PluginList` 安装插件

## Pro 版安装

Pro 版本精简了一些配置和插件，并用插件管理器 Vundle 管理插件，同时增强了对 Python 高亮的支持。安装只需要进入 vim-pro 目录，然后执行 make 命令即可：

> cd ./vim-pro
>
> make

如何需要手动安装，可以参考 [Makefile](./vim-pro/Makefile) 文件的内容

## 快捷键

#### 功能键映射

```
<F1>：查看帮助文档
<F2>：生成/更新 tags 文件；Ctrl+F2 删除 tags 文件
<F3>：快速注释
<F4>：取消注释
<F5>：快速编译C文件
<F6>：快速运行C文件
<F7>：Without
<F8>：快速添加作者信息
<F9>：激活/取消vim的粘贴模式
<F10>：打开菜单
<F11>：全屏对话框
<F12>：开关 Guake Terminal
<SPACE>：--空格键：开关折叠
Tab：自动补全

\ee：快捷打开配置文件.vimrc，这是一个快捷功能键映射
\w: 清除行尾多余空格
```

#### 插件快捷键

```
nt（m） --打开目录树
wm（m） --打开文件浏览器
A(d)    --快速切换头文件和源文件
ctrl+] （c）  --跳到定义处，ctags插件应用
ctrl+t （c）  --返回，ctags插件应用

运行终端命令：(m)
   ConqueTerm       <command>:  在当前的窗口打开<command>
   ConqueTermSplit  <command>:  横向分割一个窗口之后打开<command>
   ConqueTermVSplit <command>:  竖向分割一个窗口之后打开<command>
   ConqueTermTab    <command>:  先建一个tab页之后打开<command>

添加各类注释：(m)
   Dox           --添加函数注释
   DoxLic        --添加许可协议
   DoxAuthor     --添加作者信息

多重光标选取：(m)
   ctrl+n  选中光标下的单词，继续按则选择下一个相同的单词
   ctrl+p  撤销选择，选中上一个
   ctrl+x  跳过下一个相同单词
   Esc     取消选择
```

#### Vim 自身的一些快捷键

**注：** m-命令模式，d-底行命令模式，c-插入模式

```
set list (d)     --显示不可视字符
set paste (d)    --切换到粘贴模式
set nopaste (d)  --取消粘贴模式
1,3 co 7 (d)     --把 1 到 3 行的内容粘贴到 7 行后边
%s/<已存在字符串>/<要替换的字符串>/g (d)    --全局替换

r (m)         --更改当前的字符
R (m)         --更改多个字符
cw (m)        --更改一个单词
c$ (m)        --更改从当前字符到行尾
cc (m)        --更改整行
cf + 字符 (m) --更改从当前字符到指定字符

x (m)         --删除字符
dw (m)        --删除一个单词
d$ (m)        --删除从当前光标到行尾
dd (m)        --删除一行
df + 字符 (m) --删除从当前字符到指定字符

ggyG (m)      --复制整个文件
yw (m)        --复制单词
y$ (m)        --复制当前光标到行尾
yy (m)        --复制整行
yf + 字符 (m) --复制从当前字符到指定字符

u (m)         --撤销
ctrl + r (m)  --重做

^ (m)         --移动到行首
$ (m)         --移动到行尾
w (m)         --光标向右移动一个单词
b (m)         --光标向左移动一个单词
gg (m)        --移到文件首行
G (m)         --移到尾行
Ctrl + f(m)   --向下翻页
Ctrl + b(m)   --向上翻页
H (m)         --可以移动到屏幕的首行
L (m)         --到屏幕尾行
M (m)         --到屏幕中间
zt (m)        --将当前行移到屏幕顶部
zz (m)        --将当前行移到屏幕中部
zb (m)        --将当前行移到屏幕底部

gg=G (m)      --整理错乱的代码
[D (m)        --光标放到宏上，可以查看宏的定义
% (m)         --跳转到匹配的括号
gd (m)        --高亮当前单词
ZZ (m)        --保存并退出vim，注意 Z 为大写
Ctrl + a (m)  --自动把光标下的数字加1

块选择：
v (m)         --按字符选择
V (m)         --按行选择
Ctrl + v (m)  --选择矩形字符块

块替换：
(1) Ctrl + v 选择要替换的块
(2) 接着按c键，然后输入替换内容
(3) 最后按esc键，完成替换
```

#### 删除或者选中括号或者引号中的内容

Vim 可以快速删除或者选中 `''` `"` `()` 等。删除以 `d` 为前缀，选中以 `v` 为前缀。

```
# 删除括号或者引号中的内容
di(
di'
di"

# 选中括号或者引号中的内容
vi(
vi'
vi"

# 包括括号或者引号一起删除
da(
da'
da"

# 包括括号或者引号一起选中
va(
va'
va"

# 删除一个单词
diw
```

## 保存没有权限修改的只读文件

前提是用户需要有 sudo 权限：

```
:w !sudo tee %
```

## 文件编码与格式

查看文件编码:

```
:set fileencoding
```

转换文件编码（示例转换为 utf-8）：

```
:set fileencoding=utf-8
```

查看文件格式：

```
:set fileformat?
```

设置文件格式为 unix：

```
:set fileformat=unix
```

## 处理 UTF-8 编码中的 BOM

查询 BOM

```
:set bomb?
```

添加 BOM

```
:set bomb
```

删除BOM

```
:set nobomb
```
