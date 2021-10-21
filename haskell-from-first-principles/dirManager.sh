#!/bin/bash

# create directories for every chapter and solutions within each dir

for((i=1; i<=30; i++))
    do
        printf -v dirname "chapter%02d" "$i"
        mkdir -p -- "$dirname"
        mkdir -p -- "$dirname/solutions"
        echo "# Chapter $i from the legendary [Haskell Programming from first principles](https://haskellbook.com/) 
        
        This folder contains **my notes** from the book as well as the end chapter **solutions**" > "$dirname/README.md"
    done
