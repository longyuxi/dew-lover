#!/usr/bin/env bash

if ! pwd | grep -e 'dew-lover$'; then
    echo 'please cd into the root of the dew-lover directory then run this script.'
    exit
fi

tree > data_file_tree.txt
