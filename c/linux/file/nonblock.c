#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>

#include <stdio.h>

int main(int argc, char* argv[]) {
	int fd, nr;
	char buf[16];

	fd = open(argv[1],O_RDONLY | O_NONBLOCK);
	if (fd == -1)
		perror("open");

start:
	nr = read(fd, buf, 16);
	
	if (nr == -1) {
		if (errno == EAGAIN)
			printf("EAGAIN\n");
		perror("read");
	}

	close(fd);
	return 0;
}
