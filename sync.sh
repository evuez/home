#!/bin/bash

SYNC_DIR=~/Sync
BAK_DIR=~/Sync/bak
FILES=(
  .gitconfig
  .vimrc
  .vim/colors/Tomorrow-Night-Bright.vim
  .vim/colors/pencil.vim
  .vim/spell
  .inputrc
  .bashrc
  .bash_profile
  .ackrc
  .tmux.conf
  .config/fish/functions
  .config/fish/config.fish
  .config/fish/fishd.osiris.home
  .config/fish/fishd.aura
  .config/alacritty/alacritty.yml
  .config/terminator/config
  .weechat/weechat.conf
  .weechat/alias.conf
  .weechat/aspell.conf
  .weechat/buffers.conf
  .weechat/charset.conf
  .weechat/exec.conf
  .weechat/logger.conf
  .weechat/plugins.conf
  .weechat/script.conf
  .weechat/trigger.conf
  .weechat/relay.conf
  .weechat/xfer.conf
  bin/docker-cleanup
)

echo -n "Creating backup directory at $BAK_DIR... "
mkdir -p $BAK_DIR
echo "done!"

echo -n "Selecting synced directory $SYNC_DIR... "
cd $SYNC_DIR
echo "done!"

echo "Backing up synced files..."
for file in ${FILES[@]}; do
    cp -r --parents -L ~/$file $BAK_DIR
    rm -r ~/$file
    echo -n "Creating symlink to $file in home directory... "

    if [[ -d $file ]]; then
        ln -s $SYNC_DIR/$file ~/$(dirname "$file")
    else
        ln -s $SYNC_DIR/$file ~/$file
    fi

    echo "done!"
done
