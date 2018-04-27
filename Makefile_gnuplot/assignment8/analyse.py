#!/usr/bin/python
import os

mode = 'r'
logfile = 'logs.txt'
logs = open(logfile, mode)

mode = 'w+'
filename = 'scatter_1.out'
scatter_1 = open(filename, mode)
for i in range(20):
	for j in range(10):
                line = logs.readline()
                time = line.split()
        	if i == 0:
        		scatter_1.write("1000 %s\n" % time[3])
        	elif i == 5:
			scatter_1.write("10000 %s\n" % time[3])
		elif i == 10:
                        scatter_1.write("100000 %s\n" % time[3])
		elif i == 15:
                        scatter_1.write("1000000 %s\n" % time[3])
scatter_1.close()
logs.close()

mode = 'r'
logfile = 'logs.txt'
logs = open(logfile, mode)
mode = 'w+'
filename = 'scatter_2.out'
scatter_2 = open(filename, mode)
for i in range(20):
        for j in range(10):
                line = logs.readline()
                time = line.split()
                if i == 1:
                        scatter_2.write("1000 %s\n" % time[3])
                elif i == 6:
                        scatter_2.write("10000 %s\n" % time[3])
                elif i == 11:
                        scatter_2.write("100000 %s\n" % time[3])
                elif i == 16:
                        scatter_2.write("1000000 %s\n" % time[3])
scatter_2.close()
logs.close()

mode = 'r'
logfile = 'logs.txt'
logs = open(logfile, mode)
mode = 'w+'
filename = 'scatter_4.out'
scatter_4 = open(filename, mode)
for i in range(20):
        for j in range(10):
                line = logs.readline()
                time = line.split()
                if i == 2:
                        scatter_4.write("1000 %s\n" % time[3])
                elif i == 7:
                        scatter_4.write("10000 %s\n" % time[3])
                elif i == 12:
                        scatter_4.write("100000 %s\n" % time[3])
                elif i == 17:
                        scatter_4.write("1000000 %s\n" % time[3])
scatter_4.close()
logs.close()

mode = 'r'
logfile = 'logs.txt'
logs = open(logfile, mode)
mode = 'w+'
filename = 'scatter_8.out'
scatter_8 = open(filename, mode)
for i in range(20):
        for j in range(10):
                line = logs.readline()
                time = line.split()
                if i == 3:
                        scatter_8.write("1000 %s\n" % time[3])
                elif i == 8:
                        scatter_8.write("10000 %s\n" % time[3])
                elif i == 13:
                        scatter_8.write("100000 %s\n" % time[3])
                elif i == 18:
                        scatter_8.write("1000000 %s\n" % time[3])
scatter_8.close()
logs.close()

mode = 'r'
logfile = 'logs.txt'
logs = open(logfile, mode)
mode = 'w+'
filename = 'scatter_16.out'
scatter_16 = open(filename, mode)
for i in range(20):
        for j in range(10):
                line = logs.readline()
                time = line.split()
                if i == 4:
                        scatter_16.write("1000 %s\n" % time[3])
                elif i == 9:
                        scatter_16.write("10000 %s\n" % time[3])
                elif i == 14:
                        scatter_16.write("100000 %s\n" % time[3])
                elif i == 19:
                        scatter_16.write("1000000 %s\n" % time[3])
scatter_16.close()
logs.close()

mode = 'r'
logfile = 'logs.txt'
logs = open(logfile, mode)

mode = 'w+'
filename = 'line_plot.out'
lineplot = open(filename, mode)
for i in range(20):
        sum = 0
        sq_sum = 0
        for j in range(10):
                line = logs.readline()
                time = line.split()
                sum = sum + (float)(time[3])
                sq_sum = sq_sum + (float)(time[3])*(float)(time[3])
                if i == 1:
                        avg_1000_1 = avg
                        var_1000_1 = var
                elif i == 2: 
                        avg_1000_2 = avg
                        var_1000_2 = var
                elif i == 3: 
                        avg_1000_4 = avg
                        var_1000_4 = var
                elif i == 4: 
                        avg_1000_8 = avg
                        var_1000_8 = var
                elif i == 5: 
                        avg_1000_16 = avg
                        var_1000_16 = var
                elif i == 6: 
                        avg_10000_1 = avg
                        var_10000_1 = var
                elif i == 7: 
                        avg_10000_2 = avg
                        var_10000_2 = var
                elif i == 8: 
                        avg_10000_4 = avg
                        var_10000_4 = var
                elif i == 9: 
                        avg_10000_8 = avg
                        var_10000_8 = var
                elif i == 10: 
                        avg_10000_16 = avg
                        var_10000_16 = var
                elif i == 11:
                        avg_100000_1 = avg
                        var_100000_1 = var
                elif i == 12: 
                        avg_100000_2 = avg
                        var_100000_2 = var
                elif i == 13: 
                        avg_100000_4 = avg
                        var_100000_4 = var
                elif i == 14: 
                        avg_100000_8 = avg
                        var_100000_8 = var
                elif i == 15: 
                        avg_100000_16 = avg
                        var_100000_16 = var
                elif i == 16: 
                        avg_1000000_1 = avg
                        var_1000000_1 = var
                elif i == 17: 
                        avg_1000000_2 = avg
                        var_1000000_2 = var
                elif i == 18: 
                        avg_1000000_4 = avg
                        var_1000000_4 = var
                elif i == 19: 
                        avg_1000000_8 = avg
                        var_1000000_8 = var       
                if j == 9:
                        avg = sum/10
                        var = (sq_sum/10) - (avg*avg)
avg_1000000_16 = avg
var_1000000_16 = var
lineplot.write("1000 %.2f %.2f %.2f %.2f %.2f\n" % (avg_1000_1,avg_1000_2,avg_1000_4,avg_1000_8,avg_1000_16))
lineplot.write("10000 %.2f %.2f %.2f %.2f %.2f\n" % (avg_10000_1,avg_10000_2,avg_10000_4,avg_10000_8,avg_10000_16))
lineplot.write("100000 %.2f %.2f %.2f %.2f %.2f\n" % (avg_100000_1,avg_100000_2,avg_100000_4,avg_100000_8,avg_100000_16))
lineplot.write("1000000 %.2f %.2f %.2f %.2f %.2f\n" % (avg_1000000_1,avg_1000000_2,avg_1000000_4,avg_1000000_8,avg_1000000_16))
lineplot.close()
logs.close()

avg_speedup_1000_1 = avg_1000_1 / avg_1000_1
avg_speedup_1000_2 = avg_1000_1 / avg_1000_2
avg_speedup_1000_4 = avg_1000_1 / avg_1000_4
avg_speedup_1000_8 = avg_1000_1 / avg_1000_8
avg_speedup_1000_16 = avg_1000_1 / avg_1000_16
avg_speedup_10000_1 = avg_10000_1 / avg_10000_1
avg_speedup_10000_2 = avg_10000_1 / avg_10000_2
avg_speedup_10000_4 = avg_10000_1 / avg_10000_4
avg_speedup_10000_8 = avg_10000_1 / avg_10000_8
avg_speedup_10000_16 = avg_10000_1 / avg_10000_16
avg_speedup_100000_1 = avg_100000_1 / avg_100000_1
avg_speedup_100000_2 = avg_100000_1 / avg_100000_2
avg_speedup_100000_4 = avg_100000_1 / avg_100000_4
avg_speedup_100000_8 = avg_100000_1 / avg_100000_8
avg_speedup_100000_16 = avg_100000_1 / avg_100000_16
avg_speedup_1000000_1 = avg_1000000_1 / avg_1000000_1
avg_speedup_1000000_2 = avg_1000000_1 / avg_1000000_2
avg_speedup_1000000_4 = avg_1000000_1 / avg_1000000_4
avg_speedup_1000000_8 = avg_1000000_1 / avg_1000000_8
avg_speedup_1000000_16 = avg_1000000_1 / avg_1000000_16

mode = 'w+'
filename = 'speedup.out'
speedup = open(filename, mode)
speedup.write("#Elements Threads_1 Threads_2 Threads_4 Threads_8 Threads_16\n")
speedup.write("1000 %f %f %f %f %f %f %f %f %f %f\n" % (avg_speedup_1000_1,avg_speedup_1000_2,avg_speedup_1000_4,avg_speedup_1000_8,avg_speedup_1000_16,var_1000_1,var_1000_2,var_1000_4,var_1000_8,var_1000_16))
speedup.write("10000 %f %f %f %f %f %f %f %f %f %f\n" % (avg_speedup_10000_1,avg_speedup_10000_2,avg_speedup_10000_4,avg_speedup_10000_8,avg_speedup_10000_16,var_10000_1,var_10000_2,var_10000_4,var_10000_8,var_10000_16))
speedup.write("100000 %f %f %f %f %f %f %f %f %f %f\n" % (avg_speedup_100000_1,avg_speedup_100000_2,avg_speedup_100000_4,avg_speedup_100000_8,avg_speedup_100000_16,var_100000_1,var_100000_2,var_100000_4,var_100000_8,var_100000_16))
speedup.write("1000000 %f %f %f %f %f %f %f %f %f %f\n" % (avg_speedup_1000000_1,avg_speedup_1000000_2,avg_speedup_1000000_4,avg_speedup_1000000_8,avg_speedup_1000000_16,var_1000000_1,var_1000000_2,var_1000000_4,var_1000000_8,var_1000000_16))
speedup.close()
