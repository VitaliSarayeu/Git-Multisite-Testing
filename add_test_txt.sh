#!/bin/bash

#Create and commit-push a TEST.txt file in each repo

REPOS=/media/test-repo/*.git

for file in $REPOS
do
  git clone $file
done

LOC=$(pwd)/*

for file in $LOC
do
  touch $file/TEST.txt
  cd $file
  git add TEST.txt
  git commit -m "added TEST.txt"
  git push origin master
  git branch test1
  git branch test2
  git push origin test1
  git push origin test2
  cd ..
done