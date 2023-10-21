CC = gcc
SRC = src/
CFLAGS = -Wall -pg -fno-omit-frame-pointer -ftree-vectorize -O2

.DEFAULT_GOAL = MD2.exe

MD.exe: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

MD2.exe: $(SRC)/MD2.cpp
	$(CC) $(CFLAGS) $(SRC)MD2.cpp -lm -o MD2.exe

clean:
	find . -type f \( ! -path "./src/*" ! -name "Makefile" ! -name "inputdata.txt" \) -exec rm -v {} \;

run:
	./MD.exe < inputdata.txt

run2:
	./MD2.exe < inputdata.txt