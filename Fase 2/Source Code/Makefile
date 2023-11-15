CC = gcc
SRC = src/
CFLAGSO2 = -pg -ftree-vectorize -O2
CFLAGSO3 = -pg -ftree-vectorize -O3
CFLAGSGPROF = -pg -O2 -ftree-vectorize

.DEFAULT_GOAL = all

all : MDseq.exe MDpar.exe

MDseq.exe: $(SRC)/MDseq.cpp
        module load gcc/11.2.0;
        $(CC) $(CFLAGSO2) $(SRC)MDseq.cpp -lm -o MDseq.exe
        srun --partition=cpar perf stat -e cache-references,cache-misses -M cpi ./MDseq.exe < inputdata.txt

MDpar.exe: $(SRC)/MDpar.cpp
        module load gcc/11.2.0;
        $(CC) $(CFLAGSO2) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe -lstdc++
        srun --partition=cpar perf stat -e cache-references,cache-misses -M cpi ./MDpar.exe < inputdata.txt

gprof:
        $(CC) $(CFLAGSGPROF) $(SRC)MDseq.cpp -lm -o MDseq.exe
        ./MDseq.exe < inputdata.txt
        gprof MDseq.exe gmon.out > gprof.txt
        cat gprof.txt

runseq:
        ./MDseq.exe < inputdata.txt

runpar:
        ./MDpar.exe < inputdata.txt

clean:
        find . -type f \( ! -path "./src/*" ! -name "Makefile" ! -name "inputdata.txt" \) -exec rm -v {} \;