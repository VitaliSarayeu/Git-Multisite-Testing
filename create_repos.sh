#!/bin/bash
#Create 20 test repositories in replicated volume for glusterfs test

for i in {1..20}
do
  echo "Creating test repository $i.git"
  mkdir $i.git
  cd $i.git
  git init --bare
  cd ..
done