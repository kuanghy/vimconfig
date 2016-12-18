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

如何需要手动安装，可以参考 [Makfile](./vim-pro/Makefile) 文件的内容
