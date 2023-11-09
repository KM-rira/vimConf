#!/bin/sh

OS=$(uname)

case $OS in
    'Linux')
        echo "Linux"
        mkdir -p ~/.config/nvim
        cp init.vim ~/.config/nvim/init.vim
        ;;
    'Darwin')
        echo "Mac"
        ;;
    'WindowsNT' | 'CYGWIN'* | 'MINGW'*)
        echo "Windows"
        mkdir -p ~/AppData/Local/nvim
        cp init.vim ~/AppData/Local/nvim/init.vim
        ;;
    *)
        echo "Unknown OS: $OS"
        ;;
esac

