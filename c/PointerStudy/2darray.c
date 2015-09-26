#include <stdio.h>

int main() {
	int a[5][7];
	//error
	//int *pa[7] = a;
	int (*pa)[7] = a;
	for (int i = 0; i < 5 * 7; i++) {
		*((int *)a + i)  = i;
	}

	for (int i = 0; i < 5; i ++)
		for (int j = 0; j < 7; j++)
		{
			printf("%p %d\n", &a[i][j], a[i][j]);
			printf("%p %d\n", &pa[i][j], pa[i][j]);
		}

	return 0;
}
