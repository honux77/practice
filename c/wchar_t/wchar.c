#include <stdio.h>
#include <string.h>
#include <wchar.h>
#include <locale.h>
#include <stdlib.h>
#include <time.h>

void print_name(wchar_t all[]);

int main(void) {
	srand(time(NULL));
	setlocale(LC_ALL, "ko_KR.utf8");
	wchar_t all[] = L"정호영구승모박재성임석현윤지수전용우김동진";
	wprintf(L"%ls\n", all);
	wprintf(L"length= %d\n", wcslen(all)); 
	print_name(all);
	print_name(all);
	return 0;
}

void print_name(wchar_t all[]) {
	wchar_t name[4];
	int len = wcslen(all);
	int i = 0;
	int idx;
	for (i = 0;i < 3; i++) {
		idx = rand() % len;
		name[i] = all[idx];
	}
	name[i] = '\0';
	wprintf(L"%ls\n", name);
}
