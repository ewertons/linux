#!/bin/bash

set -e

echo "alias ll='ls -l'" >> ~/.profile
echo "alias lll='ls -la'" >> ~/.profile
echo "alias ..='cd ..'" >> ~/.profile
echo "alias cmakedbg='cmake -DCMAKE_BUILD_TYPE=Debug'" >> ~/.profile
echo "alias vgrnd='valgrind --leak-check=full --track-origins=yes'" >> ~/.profile
echo "alias m='make -j'" >> ~/.profile
echo "alias grep='grep --color=always'" >> ~/.profile

echo ':set expandtab' >> ~/.vimrc
echo ':set tabstop=4' >> ~/.vimrc
echo ':set shiftwidth=4' >> ~/.vimrc
echo ':set number' >> ~/.vimrc
echo ':set hlsearch' >> ~/.vimrc
echo ':set noautoindent' >> ~/.vimrc
echo ':set nosmartindent' >> ~/.vimrc
echo ':set nocindent' >> ~/.vimrc
echo ':set indentexpr=' >> ~/.vimrc

echo 'set print pretty' >> ~/.gdbinit
echo 'set pagination off' >> ~/.gdbinit
echo 'set print elements 0' >> ~/.gdbinit


