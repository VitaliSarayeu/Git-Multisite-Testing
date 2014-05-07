#!/bin/bash

LOC=$(pwd)/*

for file in $LOC
do
  touch $file/TEST.txt
  cd $file
  git branch -D test1
  git branch -D test2
  git push origin test1
  git push origin test2
  cd ..
done