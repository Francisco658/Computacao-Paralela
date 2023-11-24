CC = gcc
SRC = src/
CFLAGS = -pg -O2 -ftree-vectorize

.DEFAULT_GOAL = all

all: MDseq.exe MDpar.exe

MDseq.exe: $(SRC)/MDseq.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDpar.exe: $(SRC)/MDpar.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe
	sbatch test.sh

clean:
	find . -type f \( ! -path "./src/*" ! -name "Makefile" ! -name "threads.out" !  -name "threads2.out" ! -name "inputdata.txt" ! -name "test.sh" \) -exec rm -v {} \;

runseq: MDseq.exe
	./MDseq.exe < inputdata.txt

runpar2: MDpar.exe
	./MDpar.exe < inputdata.txt

runpar: MDpar.exe
	export OMP_NUM_THREADS=2;\
	./MDpar.exe < inputdata.txt
