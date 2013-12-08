#!/bin/bash
BUNDLE_DIR=$VIM_DIR/bundle

case $1 in
  'postInstall')
    pushd $BUNDLE_DIR/vimproc
    make
    popd
  ;;
  'update')
    pushd $BUNDLE_DIR/neobundle.vim
    git pull
    popd
  ;;
esac
