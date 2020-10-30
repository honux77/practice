CC = g++
CXXFLAGS = -Wall -O2 --std=c++17

hello: hello.o
	$(CC) $(CXXFLAGS) -o hello hello.o

hello.o: hello.cpp
	$(CC) $(CXXFLAGS) -c hello.cpp 
