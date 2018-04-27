set terminal postscript eps enhanced color

set key samplen 2 spacing 1.5 font ",15"

set xtics font ",15"
set ytics font ",15"
set ylabel font ",20"
set xlabel font ",20"

set xlabel "Number of Elements"
set ylabel "Average time taken"
set ytic auto
set xtic auto

set key top left

set title "Line plot for average time taken"
set output "thread_compare.eps"
plot 'line_plot.out' using 1:2 title "1 Thread" with linespoints, \
     '' using 1:3 title "2 Threads" with linespoints pt 5 lc 5,\
     '' using 1:4 title "4 Threads" with linespoints pt 2 lc 3,\
     '' using 1:5 title "8 Threads" with linespoints pt 3 lc 4,\
     '' using 1:5 title "16 Threads" with linespoints pt 4 lc 2

