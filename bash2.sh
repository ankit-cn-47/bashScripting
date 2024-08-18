#!/bin/bash

#debug mode
set -x 

# exit the script when there is an error, if not used the script continues to execute even if some step fails
set -e

# set -e does not error out when statement with pipe has error, to check such error we use set -o pipefail
set -o pipefail

#hardrive capacity 
df -H

#RAM status
free -g

#Number of processors
nproc

# list all processes
ps -ef | grep "<process name>"

#grep usage
grep "find criteria" filename

#awk used to pick 4th row from the output of grep
grep "name" test | awk -F" " '{print $4}'

#sed - stream editor
sed 's/toBeReplaced/ItemToBePlaced/g' filename


#curl request displays the output on the console/terminal
curl -X GET www.google.com

#wget - similar to curl but it first download the output to the local file system
wget www.google.com

#which displays where the command is installed if it's available otherwise displays nothing
which python3

#find - to search at a location
find /etc -name "file name"

#trap - to prohibit signal transmission to kernel
trap "echo don't use the ctrl+c" SIGINT

# to compress file using tar
tar -cvf archive.tar files.txt to.txt be.txt compressed.txt

# to extract file using tar
tar -zcvf archive.tar files.txt extracted.txt



