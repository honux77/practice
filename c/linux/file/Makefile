all: test write_append

test: test.c
	gcc -o test test.c
write_append: write_append.c
	gcc -o write_append write_append.c
clean:
	rm -f *.o test write_append
