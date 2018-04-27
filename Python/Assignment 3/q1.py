#!/usr/bin/python
import sys

num=sys.argv[1]

#Handling negative numbers
if num[0]=='-':
        flag=1
        num=num.replace("-","",1)
else:
        flag=0
num=num.lstrip('0')
b=sys.argv[2]

#Validity of length of base
if len(b)>2:
	print "Invalid Input"
	exit(1)

#Converting base to integer
if len(b)==2:
	base = (ord(b[0])-ord('0'))*10 + (ord(b[1])-ord('0'))
else:
	base = (ord(b[0])-ord('0'))

#Validity of base
if base>36 or base<2:
	print "Invalid Input"
        exit(1)

#For floating points 
dind=num.find('.')-1
length=len(num)-1

if dind!=-2:
	num=num.replace(".","",1)

#Validity of number
if base<10:
	for i in num:
		if not( ord(i) >= ord('0') and ord(i) <= base+ord('0')-1 ):
			print "Invalid Input"
			exit(1)
elif base>=10: 
	for i in num:
		if not( ( ord(i) >= ord('0') and ord(i) <= ord('9') ) or ( ord(i) >= ord('A') and ord(i) <= base+ord('A')-11 ) ):
			print "Invalid Input"
			exit(1)			

#Dictionary to store values of digits
value = dict()
for x in range(0,10):
	value[chr(ord('0')+x)]=x
for x in range(10,36):
	value[chr(ord('A')+x-10)]=x
for x in range(10,36):
        value[chr(ord('a')+x-10)]=x

ans=0

#Calculating Nd
if dind == -2:
	for i in num:
		ans=ans+value[i]*(base**length)
		length-=1
else:
	for i in num:
		ans=ans+value[i]*(base**dind)
		dind-=1

#Printing for +ve and -ve numbers
if flag==1:
	ans = -ans
else:
	ans = ans

print '{0:.9f}'.format(ans).rstrip('0').rstrip('.')
exit(0)	
