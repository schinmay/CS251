#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
#Function to scan sub-directories and c files recursively
recurse()
{
        cd $1
        for line in *
        do
		if [ -d "$line" ]
                then
			recurse $line
                fi
        done
        for line in *
        do
                regex='*\.\c$'
		if [[ "$file" =~ $regex ]]
                then
			cat $file >> $1/confile.txt
                fi
        done
        cd ..
}
if [ $# -ne 1 ]
then
        echo "Usage: $0 <dir-path>"
        exit -1
fi
echo -n > confile.txt
recurse $1
#echo | awk -v cprog=$confile -f q1.awk


