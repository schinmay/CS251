#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Usage: $0 <number>"
	exit -1
fi
regex='^[0]+$'
#Removing preceding 0s
if [[ $1 =~ $regex ]]
then
    	echo "zero"
    	exit 0
else
    number=$(echo $1 | sed 's/^0*//')
fi
regex2='^[0-9]+$'
#To check validity of input,i.e whether input is a number or not in the range {0,99999999999}
if ! [[ $number =~ $regex2 ]]
then
	echo "invalid input"
	exit -1
fi
if [[ $number -gt 99999999999 ]] 
then
        echo "invalid input"
        exit -1
fi
ones=(one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
tens=(twenty thirty forty fifty sixty seventy eighty ninety)
#Prefix for crore, lakh, thousand and hundred
prefix()
{
	num=$1
	if [[ $num -ge 20 ]]
	then
		tem1=`echo $(($(($num / 10)) - 2)) | bc`
		tem2=`echo $(($(($num % 10)) - 1)) | bc`
		echo -n ${tens[$tem1]}
		echo -n " "
		echo -n ${ones[$tem2]}
		echo -n " "
	else
		tem3=`echo $(($num - 1)) | bc`
		echo -n ${ones[$tem3]}
		echo -n " " 
	fi
}
#Taking cases thousand crore, hundred crore, crore, lakh, thousand, hundred and less than hundred
if (("$number" >= 10000000000))
then
    	temp1=`echo $(($(( $number / 10000000000 )) % 100)) | bc` 
	prefix $temp1
    	echo -n "thousand "
fi
if (("$number" >= 1000000000))
then
    	temp2=`echo $(($(( $number / 1000000000 ))  % 10)) | bc`
	prefix $temp2
   	echo -n "hundred "
fi
if (("$number" >= 10000000))
then
	temp3=`echo $(($(( $number / 10000000 )) % 100)) | bc`
	prefix $temp3
	echo -n "crore "
fi
if (("$number" >= 100000))
then 
	temp4=`echo $(($(( $number / 100000 )) % 100)) | bc`
	prefix $temp4
	echo -n "lakh "
fi
if (("$number" >= 1000))
then
	temp5=`echo $(($(( $number / 1000 )) % 100)) | bc`
   	prefix $temp5
   	echo -n "thousand "
fi
if (("$number" >= 100))
then
	temp6=`echo $(($(( $number / 100 )) % 10)) | bc`
    	prefix $temp6
    	echo -n "hundred "
fi
temp7=`echo $(($number % 100)) | bc`
prefix $temp7
echo " "
exit 0
