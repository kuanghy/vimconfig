#############################################################
# Generic Makefile for C/C++ Program
#
# License: GPL (General Public License)
# Author:  Huoty <sudohuoty AT 163 DOT com>
# Date:    2014/11/04
#
# Description:
# ------------
# ( project overview )
#
# Make Target:
# ------------
# The Makefile provides the following targets to make:
#   $ make           compile and link
#   $ make NODEP=yes compile and link without generating dependencies
#   $ make objs      compile only (no linking)
#   $ make tags      create tags for Emacs editor
#   $ make ctags     create ctags for VI editor
#   $ make clean     clean objects and the executable file
#   $ make distclean clean objects, the executable and dependencies
#   $ make help      get the usage of the makefile
# 
#============================================================


#### 宏定义:
####---------------------------------------------------------

# 项目名称
PRONAME = app

# 项目版本号
VERSION = 0.1

# 应用程序名称
PROGRAM = app

# 获取当前目录下的源文件
SRC = $(wildcard *.c)  
OBJ = $(patsubst %.c,%.o,$(SRC))

# 编译选项
CC = gcc
W = -Wall
O = -O0
CFLAGS = -c
CPPFLAGS =
DEBUG = -g
LIBS = 

# 程序安装目录
DESTDIR =
BINDIR = $(DESTDIR)/usr/bin
LIBDIR = $(DESTDIR)/usr/lib
INCDIR = $(DESTDIR)/usr/include

# 项目备份目录和备份压缩包名
BPDIR = backup_tmp
TARNAME = $(PRONAME)_`date +%Y``date +%m``date +%d`-`date +%H``date +%M``date +%S`_bak


#### 构建项目:
####---------------------------------------------------------

all: $(PROGRAM)

$(PROGRAM): $(OBJ)   
	$(CC) $(W) $(DEBUG) $(OBJ) -o $@

%.o: %.c
	$(CC) $(W) $(DEBUG) $(O) $(CFLAGS) $< -o $@


#### 清除构建:
####---------------------------------------------------------

clean:
	@clear
	@echo "Clean files:"
	-rm $(PROGRAM)
	-rm *.o


#### 安装程序
####---------------------------------------------------------

install: 
	cp $(PROGRAM) $(BINDIR)


#### 卸载程序
####---------------------------------------------------------

remove:
	rm -f $(BINDIR)/$(PROGRAM)


#### 项目备份:
####---------------------------------------------------------

bakup:
	@clear
	@echo "Starting backup program:"
	-mkdir ~/backup/$(BPDIR)
	-cp -a ./* ~/backup/$(BPDIR)
	-mv ~/backup/$(BPDIR) ./
	@tar czvf $(TARNAME).tar.gz $(BPDIR)
	-mv ./*.tar.gz ~/backup
	-rm -rf ./$(BPDIR)


#### 定义伪目标
####---------------------------------------------------------

.PHONY: clean install remove bakup

