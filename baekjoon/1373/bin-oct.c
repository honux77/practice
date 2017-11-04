#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
	int n;
	int x = 0, i = 0;
	int d = 0;
	int exponent[3] = {1, 2, 4};
	char *input = calloc(1000000, sizeof(char));
	unsigned char *output;
	int outpos = 0;

	scanf("%s",input);
	n = strlen(input);
	output = calloc(n / 3 + 1, sizeof(char));

	for (int i = 0; i < n; i++) {
		int idx = n - 1 - i;
		if (input[idx] == '1') 
			d += exponent[ i % 3 ];
		if (i % 3 == 2) {
			output[outpos] = d;
			outpos++;
			d = 0;
		}
	}

	if (d != 0) 
		output[outpos] = d;
	else
		outpos--;

	while (outpos >= 0) {
		printf("%d", output[outpos]);
		outpos--;
	}
	printf("\n");
	return 0;
}
