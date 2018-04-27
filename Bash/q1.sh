#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
if [ $# -ne 1 ]
then
	echo "Usage: $0 <filename.xml>"
	exit -1
fi
file=`cat $1`
for line in $file
do
	word=$( echo $line | sed 's/^\s*//')
	if [ "$word" == "<dir>" ]
	then
		flag=0
	fi
	if [ "$word" == "<file>" ]
	then
		flag=1
	fi
	if [[ $word == \<name\>* ]]
	then 
		name=$( echo $word | sed 's/^<name>\s*//')
		name=$( echo $name | sed 's/\s*<\/name>$//')
		if (( flag == 0 ))
		then
			mkdir $name
			cd $name
		fi
	fi
	if [[ $word == \<size\>* ]]
	then
		size=$( echo $word | sed 's/^<size>\s*0*//')
		size=$( echo $size | sed 's/\s*<\/size>$//')
		fallocate -l $size $name 
	fi
	if [ "$word" == "</dir>" ]
	then
		cd ..
	fi
done

