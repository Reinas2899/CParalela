CC = gcc
SRC = src/
CFLAGS = -pg -Ofast -funroll-all-loops -ftree-vectorize -msse4
.DEFAULT_GOAL = MD.exe

MD.exe: $(SRC)/MD.cpp
	$(CC) $(CFLAGS) $(SRC)MD.cpp -lm -o MD.exe

clean:
	rm ./MD.exe

run:
	./MD.exe < inputdata.txt
