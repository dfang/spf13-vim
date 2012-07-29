#!/usr/bin/env sh

endpath="$HOME/.spf13-vim-3"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

echo "thanks for installing spf13-vim\n"

# Backup existing .vim stuff
echo "backing up current vim config\n"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.local $HOME/.vimrc.bundles.local; do [ -e $i ] && mv $i $i.$today; done


echo "cloning dfang/spf13-vim\n"
git clone --recursive -b 3.0 http://github.com/dfang/spf13-vim.git $endpath
mkdir -p $endpath/.vim/bundle
ln -s $endpath/.vimrc $HOME/.vimrc
ln -s $endpath/.vim $HOME/.vim
ln -s $endpath/.vimrc.local $HOME/.vimrc.local
ln -s $endpath/.vimrc.bundles.local $HOME/.vimrc.bundles.local

echo "Installing Vundle"
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "installing plugins using Vundle"
vim +BundleInstall! +BundleClean +q
