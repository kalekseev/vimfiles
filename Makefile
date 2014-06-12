.PHONY: install update

install:
	cd bundle && git clone https://github.com/gmarik/Vundle.vim.git vundle
	cd ~ && ln -s .vim/vimrc .vimrc
	vim +PluginInstall +qall

update:
	vim +PluginUpdate
