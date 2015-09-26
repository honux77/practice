#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include <stdio.h>
#include <stdlib.h>

#define BUFLEN 16
#define CHECK(no,func) do { if (no == -1) {perror(func); exit(1);}} while(0)
int main(int argc, char* argv[]) {
	char buf[BUFLEN];
	int rfd, wfd;
	ssize_t ret, wret;
	rfd = open(argv[1], O_RDONLY);
	CHECK(rfd,"open");
	wfd = open(argv[2],O_WRONLY | O_CREAT | O_APPEND, 0644);
	CHECK(wfd,"create");
	while ((ret = read(rfd, buf, BUFLEN)) > 0) {
		printf(".");
		wret = write(wfd, buf, ret);
		CHECK(wret, "write");
	}
	CHECK(ret, "read");
	printf(" finish\n");

	close(rfd);
	close(wfd);
	return 0;
}

