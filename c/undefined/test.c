#include <stdio.h>
#include <stdlib.h>

int main(void) {
	int *p = malloc(sizeof(int));
	int *q = realloc(p, sizeof(int));
	int *z = realloc(q, sizeof(int));
	*p = 1;
	*q = 2;
	*z = 3;
	if (p == q)
		printf("%p %p %p %d %d %d\n", p, q, z, *p, *q, *z);
	return 0;
}
