#!/bin/bash

set -e

if [[ $# -le 1 ]]; then
    echo "Adds many tags to one file"
    echo "Usage: tag file tagName1 tagName2 ...";
    exit 1
fi

absFile=$(readlink -e $1)
fName=$(basename $1)
for tag in ${@:2}
do
    # adding tag one by one
    d=~/.tag/$tag
    if [[ -d "$d" ]]; then
	# tag exists
	id=0
	
	# check if the file is already tagged
	tagged=0
	cnt=$(ls ~/.tag/$tag/${fName}_id* 2> /dev/null | wc -w)  # 2> stderr to /dev/null
	if [[ $cnt -ne 0 ]]; then
	    for f in $(ls ~/.tag/$tag/${fName}_id*)
	    do
		absF=$(readlink -e $f)
		if [[ "$absFile" == "$absF" ]]; then
#		    echo "$absF has already the tag '$tag'"
		    tagged=1
		    break
		fi
	    done
	fi

	while [[ $tagged -eq 0 ]]
	do
	    id=$(($id+1))
	    dest=~/.tag/$tag/${fName}_id$id
	    if [[ ! -f "$dest" ]]; then
	    # name of the symbolic link does not exist
		echo "Add tag '$tag' to file '$1'"
		ln -s $absFile $dest
		break
	    fi
	done
    else
	echo "Tag '$tag' does not exist. Call tagmake $tag to create it."
    fi
done

exit 0