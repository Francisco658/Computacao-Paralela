CC = gcc
SRC = src/
CFLAGS = -Wall -pg -ftree-vectorize -O2 -msse4 -mavx

.DEFAULT_GOAL = MD.exe

teste:
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe
	srun --partition=cpar perf stat -e cache-references,cache-misses -M cpi ./MD.exe < inputdata.txt

gprof:
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe
	./MD.exe < inputdata.txt
	gprof MD.exe gmon.out > analysis1.txt
	cat analysis1.txt

clean:
	find . -type f \( ! -path "./src/*" ! -name "Makefile" ! -name "inputdata.txt" \) -exec rm -v {} \;

run:
	./MD.exe < inputdata.txt