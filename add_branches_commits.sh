#!/bin/bash

#Create and add TEST.txt file to all repos in to master branch better do that with a separate one time run script
#Create 2 branches: test1 and test2 in each of created *.git repos - separate script
#Checkout test1 branch and edit TEST.txt by adding a line with "$DATE-TIME Test1 $hostname input string"
#Commit and push changes of the file back to the test1 branch
#Checkout test2 branch and repeat the process
#Merge test1 and test2
#Merge test2 with master
#Execute inside the volume containing *.git directories

LOC=$(pwd)
LOG_FILE=~/repotest.log
#DATE=date +"%H-%I"

exec 3>&1 1>>${LOG_FILE} 2>&1

while :
do
	for file in $LOC/*
	do
		cd $file
		git checkout test1
		echo -e " $(date +"%D - %r") : $(hostname) -> test input string test1 branch" >> TEST.txt
		git add TEST.txt
		git commit -m "$DATE test1 commit"
		git push origin test1
		
		git checkout test2
		echo -e " $(date +"%D - %r") : $(hostname) -> test input string test2 branch" >> TEST.txt
		git add TEST.txt
		git commit -m "$DATE test2 commit"
		git push origin test2
		cd ..
	done
done