#!/bin/bash

LOC=$(pwd)
LOG_FILE=~/repotest.log
#DATE=date +"%H-%I"

exec 3>&1 1>>${LOG_FILE} 2>&1

while :
do
	for file in $LOC/*
	do
		cd $file		
		git checkout test2
		echo -e " $(date +"%D - %r") : $(hostname) -> test input string test2 branch" >> TEST.txt
		git add TEST.txt
		git commit -m "$DATE test2 commit"
		git push origin test2
		cd ..
	done
done