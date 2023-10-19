CC = gcc
SRC = src/
CFLAGS = -Wall -pg -fno-omit-frame-pointer -ftree-vectorize -O2

.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	find . -type f \( ! -path "./src/*" ! -name "Makefile" ! -name "inputdata.txt" \) -exec rm -v {} \;

run:
	./MD.exe < inputdata.txt