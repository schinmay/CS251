#!/usr/bin/python
import os
import sys

mode = 'r'
threadfile = 'threads.txt'
paramfile = 'params.txt'

params = open(paramfile, mode)
threads = open(threadfile, mode)

line1=params.read()
line1=line1.replace('\n',' ')
line2=threads.read()
line2=line2.replace('\n',' ')

element_count = line1.split()
thread_count = line2.split()

for num_elements in element_count:
	for num_threads in thread_count:
		for i in range(10):
			cmd = sys.argv[1] + " " + num_elements + " " + num_threads + " >> logs.txt"
			os.system(cmd)

params.close()
threads.close()
