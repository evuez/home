sync:
	git pull --rebase origin master
	git submodule foreach git pull --rebase
	./sync.sh
	vim +PluginInstall +qall

install:
	hash vim 2>/dev/null || sudo dnf install vim
	hash git 2>/dev/null || sudo dnf install git
	hash ack 2>/dev/null || sudo dnf install ack
	hash htop 2>/dev/null || sudo dnf install htop
	hash xsel 2>/dev/null || sudo dnf install xsel
	hash http 2>/dev/null || sudo dnf install httpie
	hash terminator 2>/dev/null || sudo dnf install terminator

prepare:
	mkdir -p ~/.vim/colors
	mkdir -p ~/.vim/bundle
	mkdir -p ~/.config/terminator
	mkdir -p ~/bin
	mkdir -p ~/.config/sublime-text-3/Packages/User
	git submodule add https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim

init: install prepare

.PHONY: install prepare init sync
