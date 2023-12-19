CC1 = gcc
CC2 = nvcc
SRC = src/
CFLAGS = -g -Wall -pg -O2 -ftree-vectorize -mfpmath=sse -march=x86-64 -fno-omit-frame-pointer
CUDAFLAGS = -G -allow-unsupported-compiler -arch=sm_60

.DEFAULT_GOAL = all

all: MDseq.exe MDCuda.exe

MDseq.exe: $(SRC)/MDseq.cpp
	module load gcc/11.2.0;\
	$(CC1) $(CFLAGS) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDCuda.exe: $(SRC)/MDCuda.cu
	module load gcc/9.3.0;\
	module load cuda/11.3.1;\
	$(CC2) $(CUDAFLAGS) $(SRC)MDCuda.cu -lm -o MDCuda.exe

clean:
	find . -type f \( ! -path "./src/*" ! -name "Makefile" !  -name "inputdata.txt" \) -exec rm -v {} \;

runseq: MDseq.exe
	./MDseq.exe < inputdata.txt

runcuda: MDCuda.exe
	./MDCuda.exe < inputdata.txt