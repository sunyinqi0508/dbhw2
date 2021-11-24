all:
	g++ ./datagen.cpp -march=native -Ofast --std=c++0x -s -o datagen
clean:
	rm datagen