#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <sys/types.h>

int main(int argc, char *argv[]) 
{
	int serv_socket;
	int clnt_socket;
	
	struct sockaddr_in serv_addr;
	struct sockaddr_in clnt_addr;
	socklen_t clnt_addr_size;

	if (argc != 2) {
		printf("Usage :% <port>\n", argv[0]);
		exit(1);
	}

	serv_socket = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);

