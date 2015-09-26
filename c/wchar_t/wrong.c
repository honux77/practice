#include <stdio.h>
#include <string.h>

int main(void) {
	char *all = "안녕하세요";
	char buf[16];
	buf[0] = all[3];
	buf[1] = all[4];
	buf[2] = all[5];
	buf[3] = '\0';
	printf("%s\n", all);
	printf("length= %d\n", strlen(all)); //5?
	printf("all[3]= %c\n", all[3]);
	printf("all[3][4][5]= %c%c%c\n", all[3], all[4], all[5]);
	printf("buf = %s\n", buf);
	return 0;
}
