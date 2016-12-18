.PHONY: install

install:
	@echo "Installing vimrcs..."
	rm -rf ~/.vim
	rm -rf ~/.vimrc
	rm -rf ~/.vimrc.plugin
	mkdir -p ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s $(PWD)/vimrc ~/.vimrc
	ln -s $(PWD)/vimrc.plugin ~/.vimrc.plugin
	ln -s $(PWD)/syntax ~/.vim/
	ln -s $(PWD)/skeleton ~/.vim/
