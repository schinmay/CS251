set term postscript eps enhanced monochrome 20 dashed dashlength 1 lw 1.5

set key samplen 2 spacing 1 font ",15"

set xtics font ",15"
set ytics font ",15"
set ylabel font ",20"
set xlabel font ",20"

set xlabel "Number of elements"
set ylabel "Time taken"
set ytic auto
set xtic auto

set title "Scatter plot for 1 thread"
set output "scatter_1.eps"
plot 'scatter_1.out' using 1:2 notitle with points pt 1 ps 1.5

set title "Scatter plot for 2 threads"
set output "scatter_2.eps"
plot 'scatter_2.out' using 1:2 notitle with points pt 1 ps 1.5

set title "Scatter plot for 4 threads"
set output "scatter_4.eps"
plot 'scatter_4.out' using 1:2 notitle with points pt 1 ps 1.5

set title "Scatter plot for 8 threads"
set output "scatter_8.eps"
plot 'scatter_8.out' using 1:2 notitle with points pt 1 ps 1.5

set title "Scatter plot for 16 threads"
set output "scatter_16.eps"
plot 'scatter_16.out' using 1:2 notitle with points pt 1 ps 1.5