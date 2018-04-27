all: app.ex1 logs.txt analysis eps report.pdf

App: app.ex1 
runtest: logs.txt 
analyse: analysis 
plot: eps
report: report.pdf

CC = gcc
CFLAGS = -g -I. -DDBG
PY = python
GP = gnuplot
PL = pdflatex

OBJS = prog.o thread_function.o

app.ex1 : $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) -lpthread -lm

logs.txt : app.ex1 runtest.py
	$(PY) runtest.py ./$<

analysis : analyse.py logs.txt
	$(PY) $<

PLOTS = scatter.p lineplot.p plot_speedup.p
eps : $(PLOTS) analysis
	$(GP) scatter.p
	$(GP) lineplot.p
	$(GP) plot_speedup.p

report.pdf : report.tex eps
	$(PL) $<
	
$(OBJS): common.h
prog.o: thread_function.o

%.o : %.c
	$(CC) -c $(CFLAGS) $< -o $@ -lpthread -lm

.PHONY: clean App runtest analyse plot report all
clean:
	rm -f *.o *.ex1 logs.txt *.out *.eps *.pdf report.aux report.log
