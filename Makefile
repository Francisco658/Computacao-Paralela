CC = gcc
SRC = src/
CFLAGS = -Wall -pg -ftree-vectorize -O2 -msse4 -mavx -mfpmath=sse

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

gprof:
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe
	./MD.exe < inputdata.txt
	gprof MD.exe gmon.out > analysis1.txt
	cat analysis1.txt

clean:
	find . -type f \( ! -path "./src/*" ! -name "Makefile" ! -name "inputdata.txt" \) -exec rm -v {} \;

run:
	./MD.exe < inputdata.txt