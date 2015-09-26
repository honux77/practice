#include <stdio.h>
#include <stdlib.h>

//global variables;
int g1 = 1;
int main(int argc, char *argv[]) {
	static int s1 = 10;	
	int x = 2;
	int *p = malloc(sizeof(int));
	printf("address of g1 = %p\n", &g1);		
	printf("address of s1 = %p\n", &s1);	
	printf("address of  x = %p\n", &x);
	printf("address of  p = %p\n", p);
	printf("address main  = %p\n", main);	
	return 0;
}

