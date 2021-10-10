#!/bin/bash

PWD="$(/bin/pwd)"
VIM_DIR="$HOME/.vim"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

inst_plug() {
    curl -fLo $VIM_DIR/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

inst_plugins() {
    vim -c 'PlugInstall' -c 'qa'
}

install() {
    [ -e "$VIM_DIR" ] && [ -e "$HOME/.vimrc" ] && die "$VIM_DIR and $HOME/.vimrc already exist."

    pushd "$HOME"
    git clone https://github.com/mrmoneyc/vimcfg.git "$VIM_DIR"
    popd

    ln -fs "$VIM_DIR/_vimrc" "$HOME/.vimrc"
    ln -fs "$VIM_DIR/_gvimrc" "$HOME/.gvimrc"
    ln -fs "$VIM_DIR/_vimrc" "$VIM_DIR/init.vim"

    mkdir -p "${XDG_CONFIG_HOME:=$HOME/.config}"
    if ! [ -e "$XDG_CONFIG_HOME/nvim" ]; then
        ln -s "$VIM_DIR" "$XDG_CONFIG_HOME/nvim"
    fi
    ln -s "$VIM_DIR/_vimrc" "$XDG_CONFIG_HOME/nvim/init.vim"

    pushd "$VIM_DIR"
    mkdir "$PWD/vimswap"
    popd
}

update() {
    vim -c 'PlugUpgrade' -c 'PlugUpdate' -c 'qa'
}

display_help() {
    echo "Usage: $0 {install|update}" >&2
    echo
    echo "   install                Install Vim config, Vim-Plug, and all plugins"
    echo "   update                 Update Vim-Plug and all plugins"
    echo
    exit 1
}

case "$1" in
    "install") install && inst_plug && inst_plugins ;;
    "update") update ;;
    *) display_help ;;
esac
