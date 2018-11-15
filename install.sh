#!/bin/bash
set -eu

cd $HOME
LOCAL_DIR=$HOME/local
mkdir -p $LOCAL_DIR
echo "installing prerequisites..."
sudo apt update && sudo apt install -y zsh ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip jq curl tmux

echo "installing oh-my-zsh..."
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
cat > $HOME/.zshrc <<- EOM
# zshrc alienware
. $HOME/Miaoou/conf/.zshrc.common
EOM

echo "compiling and installing neovim..."
git clone https://github.com/neovim/neovim.git
NB_CPU=$(($(lscpu -e=cpu|wc -l) - 1))
$(cd neovim && make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$LOCAL_DIR -DCMAKE_BUILD_TYPE=Release" -j$NB_CPU install)
NVIM_CONFIG_DIR=$HOME/.config/nvim
mkdir -p $NVIM_CONFIG_DIR 
ln -s $HOME/Miaoou/conf/init.vim $NVIM_CONFIG_DIR

echo "installing neovim iceberg theme..."
git clone https://github.com/cocopon/iceberg.vim.git
ln -s $HOME/iceberg.vim/colors $NVIM_CONFIG_DIR
ln -s $HOME/iceberg.vim/autoload $NVIM_CONFIG_DIR
