#!/bin/bash

dir=~/Sync
bak=~/Sync/bak
files=(
  .gitconfig
  .vimrc
  .vim/colors/Tomorrow-Night-Bright.vim
  .vim/colors/pencil.vim
  .vim/bundle/Vundle.vim
  .inputrc
  .bashrc
  .ackrc
  .tmux.conf
  .config/terminator/config
  bin/subl-update.sh
  bin/docker-cleanup
)

echo -n "Creating backup directory at $bak... "
mkdir -p $bak
echo "done!"

echo -n "Selecting synced directory $dir... "
cd $dir
echo "done!"

echo "Backing up synced files..."
for file in ${files[@]}; do
    cp -r --parents -L ~/$file $bak
    rm -r ~/$file
    echo -n "Creating symlink to $file in home directory... "
    ln -s $dir/$file ~/$file
    echo "done!"
done
