:insert
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
#   $ make           Compile and link
#   $ make clean     Clean objects and the executable file
#   $ make install   Install the application
#   $ make remove    Remove the application
#   $ make backup    Backup the project
#   $ make help      Get the usage of the makefile
#   $ make show      Show variables (for debug use only)
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
BAKDIR = backup_tmp
TARNAME = $(PRONAME)_v$(VERSION)_`date +%Y``date +%m``date +%d``date +%H``date +%M``date +%S`_bak


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

backup:
	@clear
	@echo "Starting backup program:"
	-mkdir ~/backup/$(BAKDIR)
	-cp -a ./* ~/backup/$(BAKDIR)
	-mv ~/backup/$(BAKDIR) ./
	@tar czvf $(TARNAME).tar.gz $(BAKDIR)
	-mv ./*.tar.gz ~/backup
	-rm -rf ./$(BAKDIR)


#### Show help
####---------------------------------------------------------

help:
	@echo 'Generic Makefile for C/C++ Programs.'
	@echo "Copyright (C) 2014 - `date +%Y` Huoty <sudohuoty@163.com>"
	@echo
	@echo 'Usage: make [TARGET]'
	@echo 'TARGETS:'
	@echo '  all       (=make) Compile and link.'
	@echo '  clean     Clean objects and the executable file.'
	@echo '  install   Install the application.'
	@echo '  remove    Remove the application.'
	@echo '  backup    Backup the project.'
	@echo '  show      Show variables (for debug use only).'
	@echo '  help      Print this message.'
	@echo
	@echo 'Report bugs to <sudohuoty AT 163 DOT com>.'



#### Show variables (for debug use only.)
####---------------------------------------------------------

show:
	@echo "PRONAME : " $(PRONAME)
	@echo "VERSION : " $(VERSION)
	@echo "PROGRAM : " $(PROGRAM)
	@echo "SRCS    : " $(SRC)
	@echo "OBJS    : " $(OBJ)
	@echo "DESTDIR : " $(DESTDIR)
	@echo "BINDIR  : " $(BINDIR)
	@echo "LIBDIR  : " $(LIBDIR)
	@echo "INCDIR  : " $(INCDIR)
	@echo "BAKDIR  : " $(BAKDIR)
	@echo "complile option: " $(CC) $(W) $(O) $(CFLAGS) $(CPPFLAGS) $(DEBUG) $(LIBS)
	@echo "backup archive name: " $(TARNAME)".tar.gz"


#### 定义伪目标
####---------------------------------------------------------

.PHONY: all clean install remove bakup help show


## End of the Makefile ##  Made by Huoty  ## All rights reserved ##
###################################################################
