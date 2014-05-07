#!/bin/bash

#!/bin/bash


REPOS=/media/test-repo/*.git

for file in $REPOS
do
  git clone $file
done