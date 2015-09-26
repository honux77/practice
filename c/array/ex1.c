#include <stdio.h>

void hello( int (*x)[4]) {
	for (int i = 0; i < 4; i++)
		printf("%d\n", x[0][i]);
}

void hello2(int **p) {

	for (int i = 0; i < 4; i++)
		printf("%d\n", *(*p + 4 + i));
	

}
int main(void) {
	int a[3][4] = {0};
	a[1][0] = 1;
	a[1][1] = 2;
	a[1][2] = 3;
	a[1][3] = 4;
	hello(&a[1]);
	hello2((int **) &a[1][0]);
	return 0;
}
