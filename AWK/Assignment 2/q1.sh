#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
if [ $# -ne 1 ]
then
        echo "Usage: $0 <dir-path>"
        exit -1
fi
catfile=`find $1 -name '*.c'`
cat $catfile | awk -f q1.awk
