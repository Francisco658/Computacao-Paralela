CC = gcc
SRC = src/
CFLAGS = -g -Wall -pg -O2 -ftree-vectorize -mavx -mfpmath=sse -march=x86-64 -fno-omit-frame-pointer

.DEFAULT_GOAL = all

all: MDseq.exe MDpar.exe MDpar2.exe

MDseq.exe: $(SRC)/MDseq.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDpar.exe: $(SRC)/MDpar.cpp
	module load gcc/11.2.0;\
	$(CC) $(CFLAGS) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe
	sbatch test.sh

MDpar2.exe: $(SRC)/MDpar2.cpp
	module load gcc/11.2.0; \
	$(CC) $(CFLAGS) $(SRC)MDpar2.cpp -lm -fopenmp -o MDpar2.exe
	sbatch test2.sh
	
clean:
	find . -type f \( ! -path "./src/*" ! -name "vetorizada.out" ! -name "Makefile" ! -name "threads.out" !  -name "threads2.out" ! -name "inputdata.txt" ! -name "test.sh" ! -name "test2.sh" \) -exec rm -v {} \;

runseq: MDseq.exe
	./MDseq.exe < inputdata.txt

runpar: MDpar.exe
	export OMP_NUM_THREADS=2;\
	./MDpar.exe < inputdata.txt
