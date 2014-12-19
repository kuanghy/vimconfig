#############################################################
# Generic Makefile for C/C++ Program
#
# License: GPL (General Public License)
# Author:  Huoty <sudohuoty AT 163 DOT com>
# Date:    2014/11/04 (version 0.1)
#
#============================================================

SRC = $(wildcard *.c)  
OBJ = $(patsubst %.c,%.o,$(SRC))
CC = gcc
CFLAGS = -c
LIBS = 
#CPPFLAGS = -Iinclude


app: cls $(OBJ)   
	$(CC) $(OBJ) -o $@
	@echo "\n******** Compiling completed ********\n"

%.o: %.c
	$(CC) $< $(CFLAGS) -o $@

cls: 
	@clear
	@echo "\n********* Compiling project *********\n"

clean:
	@clear
	@echo "\n********  cleanning project  ********\n"
	-rm app
	-rm *.o
	@echo "\n******** cleanning completed ********\n"


PRONAME = backup
BPDIR = backup_tmp
TARNAME = $(PRONAME)_`date +%Y``date +%m``date +%d`-`date +%H``date +%M``date +%S`_bp


bakup:
	@clear
	@echo "\n***  backuping project  ***\n"
	-mkdir ~/backup/$(BPDIR)
	-cp -a ./* ~/backup/$(BPDIR)
	-mv ~/backup/$(BPDIR) ./
	@tar czvf $(TARNAME).tar.gz $(BPDIR)
	-mv ./*.tar.gz ~/backup
	-rm -rf ./$(BPDIR)
	@echo "\n*** backuping completed ***\n"

.PHONY: clean bakup cls

