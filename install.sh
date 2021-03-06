#!/bin/bash
set -eu

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    --compiled-neovim)
    COMPILED_NEOVIM=1
    shift # past argument 
    ;;
esac
done


cd $HOME
LOCAL_DIR=$HOME/local
mkdir -p $LOCAL_DIR
echo "installing prerequisites..."
sudo apt update && sudo apt install -y zsh ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip jq curl tmux gnupg2 gnupg-agent cryptsetup scdaemon pcscd

echo "installing gpg..."
mkdir ~/.gnupg
curl -Lfo ~/.gnupg/gpg.conf https://raw.githubusercontent.com/drduh/config/master/gpg.conf
chmod 600 ~/.gnupg/*
chmod 700 ~/.gnupg
gpg --keyserver hkps.pool.sks-keyservers.net --recv 0x2EE00B95EA60F76D
echo -e "trust\n5\ny" | gpg --command-fd=0 --edit-key 0x2EE00B95EA60F76D

echo "installing oh-my-zsh..."
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
chmod -R 755 $HOME/.oh-my-zsh
cat > $HOME/.zshrc <<- EOM
# zshrc $USER@$(hostname) (generated by Miaoou/conf/install.sh)
. $HOME/Miaoou/conf/.zshrc.common
EOM

if [ -z ${COMPILED_NEOVIM+x} ]; then
	echo "installing neovim..."
	sudo apt install -y neovim	
else
	echo "compiling and installing neovim..."
	git clone https://github.com/neovim/neovim.git
	NB_CPU=$(($(lscpu -e=cpu|wc -l) - 1))
	cat < <(cd $HOME/neovim && make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$LOCAL_DIR -DCMAKE_BUILD_TYPE=Release" -j$NB_CPU && make install)
fi

NVIM_CONFIG_DIR=$HOME/.config/nvim
mkdir -p $NVIM_CONFIG_DIR 
rm $NVIM_CONFIG_DIR/init.vim
ln -s $HOME/Miaoou/conf/init.vim $NVIM_CONFIG_DIR

echo "installing vim-plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "installing neovim iceberg theme..."
git clone https://github.com/cocopon/iceberg.vim.git
rm -rf $NVIM_CONFIG_DIR/colors $NVIM_CONFIG_DIR/autoload
ln -s $HOME/iceberg.vim/colors $NVIM_CONFIG_DIR
ln -s $HOME/iceberg.vim/autoload $NVIM_CONFIG_DIR

echo "installing tmux config..."
ln -s $HOME/Miaoou/conf/.tmux.conf $HOME
