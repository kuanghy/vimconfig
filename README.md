VimConfig
=========

Unix 平台下的 vim 配置

## 安装

> git clone https://git.oschina.net/kuanghy/vimconfig.git

> cp -a vim ~/.vim

> cp vimrc ~/.vimrc

> cp vim/doc/viskey.5 /usr/share/man/zh_CN/man5/


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
```

#### Vim 自身的一些快捷键

**注：** m-命令模式，d-底行命令模式，c-插入模式

```
cw (m)        --修改一个单词
%s/<已存在字符串>/<要替换的字符串>/g (d)    --全局替换
gg=G (m)      --整理错乱的代码
[D (m)        --光标放到宏上，可以查看宏的定义
set list (d)  --显示不可视字符
% (m)         --跳转到匹配的括号
gd (m)        --高亮当前单词
w (m)         --光标向右移动一个单词
b (m)         --光标向左移动一个单词
ZZ (m)        --保存并退出vim，注意 Z 为大写
Ctrl+a (m)    --自动把光标下的数字加1


块操作：
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




