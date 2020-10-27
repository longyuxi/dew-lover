#!/usr/bin/env bash

if ! tree; then
    sudo apt-get install tree -y
fi

tree > data_file_tree.txt