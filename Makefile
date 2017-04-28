sync:
	git pull --rebase origin master
	git submodule foreach git pull --rebase origin master
	./sync.sh
	vim +PluginInstall +qall

install:
	sudo dnf -y install \
		vim \
		git \
		ack \
		htop \
		xsel \
		httpie \
		terminator \
		tmux \
		fish \
		docker docker-compose

prepare:
	mkdir -p ~/.vim/colors
	mkdir -p ~/.vim/bundle
	mkdir -p ~/.config/terminator
	mkdir -p ~/bin
	git submodule update --init --recursive

init: install prepare

.PHONY: install prepare init sync
