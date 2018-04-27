#!/usr/bin/python
import sys
import math

inptree = sys.argv[1]
bbst = [int(x) for x in inptree[1:-1].split(',')]
bbst.sort()
n = len(bbst)

tree = range(n)
htdict = {}
for i in tree:
	htdict[i] = 0

maximum=0
for j in bbst:
	length = len(str(j))
	if(length>maximum):	
		maximum = length
maximum = maximum + 2

def htcalc( tree, ht, ndash ):
	htdict[tree[(ndash-1)/2]] = ht
	if((ndash-1)/2>0):
		htcalc( tree[0:(ndash-1)/2], ht+1, (ndash-1)/2 )
	if((ndash+1)/2<ndash):
		htcalc( tree[(ndash+1)/2:ndash], ht+1, ndash/2 )
	return htdict

def spacing( spaces ):
	for z in range(spaces):
		sys.stdout.write(" ")

def pritree( tree, height, n ):
	for x in range(int(math.log(n,2))+3):
        	temp=0
                count=0
                for y in range(n):
			if(height[tree[y]]==x):
				space = maximum*y-temp-count
				spacing(space)
                               	sys.stdout.write(str(bbst[y]))
                               	temp=maximum*y
                               	count=len(str(bbst[y]))	
		sys.stdout.write("\n")
	
height = htcalc( tree, 0, n )
pritree( tree, height, n )
