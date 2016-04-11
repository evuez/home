sync:
	git pull --rebase origin master
	git submodule foreach git pull --rebase origin master
	./sync.sh
	vim +PluginInstall +qall

install:
	hash vim 2>/dev/null || sudo dnf -y install vim
	hash git 2>/dev/null || sudo dnf -y install git
	hash ack 2>/dev/null || sudo dnf -y install ack
	hash htop 2>/dev/null || sudo dnf -y install htop
	hash xsel 2>/dev/null || sudo dnf -y install xsel
	hash http 2>/dev/null || sudo dnf -y install httpie
	hash terminator 2>/dev/null || sudo dnf -y install terminator

prepare:
	mkdir -p ~/.vim/colors
	mkdir -p ~/.vim/bundle
	mkdir -p ~/.config/terminator
	mkdir -p ~/bin
	mkdir -p ~/.config/sublime-text-3/Packages/User
	git submodule update --init --recursive

init: install prepare

.PHONY: install prepare init sync
