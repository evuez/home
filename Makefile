sync:
	git pull --rebase origin master
	./sync.sh
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall

install:
	sudo dnf -y install \
		vim \
		neovim \
		git \
		ripgrep \
		htop \
		xsel \
		httpie \
		nethogs \
		tmux \
		fish \
		fzf \
		docker docker-compose

prepare:
	mkdir -p ~/.vim/colors

init: install prepare

.PHONY: install prepare init sync
