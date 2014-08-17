.PHONY: install update

install:
	git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
	vim +NeoBundleInstall +qall

update:
	vim +NeoBundleUpdate
