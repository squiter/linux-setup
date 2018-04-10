#!/bin/bash

for item in $(ls -a); do
    if [ -f $item ];then
        ln -sf $(pwd)/$item ~/$item
    elif [ -d $item ]; then
        cp -as $(pwd)/$item ~/
    fi
done
