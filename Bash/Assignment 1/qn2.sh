#!/bin/bash
#Function for indentation
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
tab()
{
	counter=0
	while [ $counter -lt $space ]
	do
		echo -n "	"
		counter=$(($counter+1))
	done
}
#Function to scan directories and files recursively
output()
{
	cd $1	
	for line in *
	do
		if [ -d "$line" ]
		then
			space=$(($space + 1))
                        output $line
                        tab
			count1=`egrep -o -d 'recurse' '\-*[0-9]+' $OLDPWD | wc -l`
                        count2=`grep -o -d 'recurse' '[0-9]\.[0-9]' $OLDPWD | wc -l`
			count3=`grep -o -d 'recurse' -e "\." -e "\!" -e "\?" $OLDPWD | wc -l`
			integers=`echo $(($count1 - $(($count2 * 2)))) | bc`
			sentences=`echo $(($count3 - $count2)) | bc`
			echo -n "	"
			echo -n "(D)"
                        echo -n ${OLDPWD/*\//}
                        echo -n "-"
                        echo -n $sentences
                        echo -n "-"
                        echo $integers
		fi
	done
	for line in *
	do
		if [ -f "$line" ]
		then
			count4=`egrep -o '\-*[0-9]+' $line | wc -l`	#Numbers
			count5=`grep -o '[0-9]\.[0-9]' $line | wc -l`	#Decimals
			count6=`grep -o -e "\." -e "\!" -e "\?" $line | wc -l`	#Sentences
			space=$(($space+1))
			tab
			int=`echo $(($count4 - $(($count5 * 2)))) | bc`    #To remove decimals
                        sent=`echo $(($count6 - $count5)) | bc`
			echo -n "(F)"
			echo -n $line
			echo -n	"-"
			echo -n $sent
			echo -n "-"
			echo $int
			space=$(($space - 1)) 
		fi
	done
	cd ..
	space=$(($space - 1))
}
if [ $# -ne 1 ]
then
	echo "Usage: $0 <dir-path>"
	exit -1
fi
output $1
#To print the parent file
count7=`egrep -o -d 'recurse' '\-*[0-9]+' $1 | wc -l`                      
count8=`grep -o -d 'recurse' '[0-9]\.[0-9]' $1 | wc -l`
count9=`grep -o -d 'recurse' -e "\." -e "\!" -e "\?" $1 | wc -l`                        
integers=`echo $(($count7 - $(($count8 * 2)))) | bc`
sentences=`echo $(($count9 - $count8)) | bc`                        
echo -n "(D)"                        
echo -n ${1/*\//}                        
echo -n "-"                        
echo -n $sentences                        
echo -n "-"                        
echo $integers

