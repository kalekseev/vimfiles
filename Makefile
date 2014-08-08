.PHONY: install update

install:
	git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
	cd ~ && ln -s .vim/vimrc .vimrc
	vim +NeoBundleInstall +qall

update:
	vim +NeoBundleUpdate
