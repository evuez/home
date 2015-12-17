#!/bin/bash

dir=~/Sync
bak=~/Sync/bak
files=(
  .gitconfig
  .vimrc
  .inputrc
  .config/sublime-text-3/Packages/User/Preferences.sublime-settings
  .config/sublime-text-3/Packages/User/Python.sublime-settings
  .config/sublime-text-3/Packages/User/Ruby.sublime-settings
  .config/terminator/config
  bin/subl-update.sh
  bin/lamp
  bin/mongodb
  bin/redis
  bin/pgsql
  bin/sideq
)

echo -n "Creating backup directory at $bak... "
mkdir -p $bak
echo "done!"

echo -n "Selecting synced directory $dir... "
cd $dir
echo "done!"

echo "Backing up synced files..."
for file in ${files[@]}; do
    cp --parents -L ~/$file $bak
    rm ~/$file
    echo -n "Creating symlink to $file in home directory... "
    ln -s $dir/$file ~/$file
    echo "done!"
done
