#include <my_global.h>
#include <mysql.h>

void finish_with_error(MYSQL* con) {
	fprintf(stderr, "MYSQL ERROR: %s\n", mysql_error(con));
	exit(1);
}

int main(int argc, char *argv[]) {
	printf("MySQL client version: %s\n", mysql_get_client_info());
	MYSQL *con = mysql_init(NULL);
	if (con == NULL) {
		finish_with_error(con);
	}
	printf("connection create success\n");

	if (mysql_real_connect(con, "localhost", "popi", "db1004", "poopidb", 0, NULL, 0) == NULL) { 
		finish_with_error(con);
	}
	printf("connect mysql success\n");
	return 0;
}
