#!/bin/bash

dir=~/Sync
bak=~/Sync/bak
files=".vimrc .gitconfig .inputrc"

echo -n "Creating backup directory at $bak... "
mkdir -p $bak
echo "done!"

echo -n "Selecting synced directory $dir... "
cd $dir
echo "done!"

echo "Backing up synced files..."
for file in $files; do
    mv ~/$file $bak
    echo -n "Creating symlink to $file in home directory... "
    ln -s $dir/$file ~/$file
    echo "done!"
done
