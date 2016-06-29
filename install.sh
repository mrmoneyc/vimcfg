#!/bin/bash
PWD=`/bin/pwd`
VIM_DIR=$HOME/.vim
BUNDLE_DIR=$VIM_DIR/bundle
GIT_REPO=""

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

postinst() {
    echo "[1;33m -- COMPILE VIMPROC  -- [m"
    pushd $BUNDLE_DIR/vimproc*
    make
    popd
}

backup_prev() {
    popd $VIM_DIR
    mkdir .vim
    cp -R * .vim
    tar zcvf $HOME/vim_config_prev.tar.gz $PWD/.vim
    popd
    rm -rf $VIM_DIR
}

update() {
    pushd $BUNDLE_DIR/neobundle.vim
    git pull
    popd
    vim -c 'NeoBundleUpdate' -c 'qa'
}

backup() {
    pushd $VIM_DIR
    git commit -a
    git push --set-upstream $GIT_REPO master
    popd
}

inst_neobundle() {
    echo "[1;33m -- INSTALL NEOBUNDLE -- [m"
    git clone git://github.com/Shougo/neobundle.vim $BUNDLE_DIR/neobundle.vim
}

inst_vimplugins() {
    echo "[1;33m -- INSTALL VIM PLUGINS -- [m"
    vim -c 'NeoBundleClean' -c 'NeoBundleInstall' -c 'qa'
}

install() {
    [ -e "$HOME/.vim" ] && [ -e "$HOME/.vimrc" ] && die "$HOME/.vim/ and $HOME/.vimrc already exist."

    pushd $HOME
    git clone https://github.com/mrmoneyc/vimcfg.git "$VIM_DIR"
    popd

    ln -fs $VIM_DIR/_vimrc $HOME/.vimrc
    ln -fs $VIM_DIR/_gvimrc $HOME/.gvimrc

    mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
    ln -s $VIM_DIR $XDG_CONFIG_HOME/nvim
    ln -s $VIM_DIR/_vimrc $XDG_CONFIG_HOME/nvim/init.vim

    pushd $VIM_DIR
    mkdir $PWD/vimswap
    mkdir $PWD/vimsauce
    popd
}

case "$1" in
    "update") update ;;
    "backup") backup ;;
    *) install && inst_neobundle && inst_vimplugins && postinst && echo "[1;33m -- DONE -- [m" ;;
esac
