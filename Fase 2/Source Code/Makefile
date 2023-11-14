CC = gcc
SRC = src/
CFLAGSO2 = -pg -ftree-vectorize -O2 -msse4 -mavx
CFLAGSO3 = -pg -ftree-vectorize -O3 -msse4 -mavx

.DEFAULT_GOAL = all

all : MDseqO2.exe MDseqO3.exe MDpar02.exe MDpar03.exe

MDseqO2.exe: $(SRC)/MDseq.cpp
		module load gcc/11.2.0;
		$(CC) $(CFLAGSO2) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDseqO3.exe: $(SRC)/MDseq.cpp
		module load gcc/11.2.0;
		$(CC) $(CFLAGSO3) $(SRC)MDseq.cpp -lm -o MDseq.exe

MDparO2.exe: $(SRC)/MDpar.cpp
		module load gcc/11.2.0;
		$(CC) $(CFLAGSO2) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe

MDparO3.exe: $(SRC)/MDpar.cpp
		module load gcc/11.2.0;
		$(CC) $(CFLAGSO3) $(SRC)MDpar.cpp -lm -fopenmp -o MDpar.exe

runseqO2:
	  ./MDseqO2.exe < inputdata.txt

runseqO3:
	  ./MDseqO2.exe < inputdata.txt

runparO2:
	  ./MDparO3.exe < inputdata.txt

runparO3:
	  ./MDparO3.exe < inputdata.txt

clean:
	find . -type f \( ! -path "./src/*" ! -name "Makefile" ! -name "inputdata.txt" \) -exec rm -v {} \;