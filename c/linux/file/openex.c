#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>

#include <stdio.h>
#include <stdlib.h>

#define BUFLEN 16
void myerr(const char* msg) {
		fprintf(stderr, "%s\n", msg);
		exit(1);
}
int main(int argc, char* argv[]) {
	int fd;
	ssize_t ret;
	char buf[BUFLEN];
	int len = BUFLEN;
	if (argc != 2) {
		myerr("usage: ./a.out filename");
	}
	fd = open(argv[1], O_RDWR | O_APPEND);
	if (fd == -1) {
		myerr("open error");
	}
	printf("fd = %d\n",fd);
	while ((ret = read(fd, buf, len)) != 0) {
		if (ret == -1) {
			if (errno == EINTR)
				continue;
			perror("read");
			break;
		}
		write(1,buf,ret);
	}

	close(fd);
	return 0;
}
