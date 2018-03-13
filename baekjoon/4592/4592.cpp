#include <stdio.h>
#include <vector>

using namespace std;

//https://www.acmicpc.net/problem/4592
int main()
{
    while(true) {
        int n, prev;
        scanf("%d", &n);        
        if (n == 0) {
            break;
        }
        vector<int> arr(n);

		for (int i = 0; i < n; i ++) {
			scanf("%d", &arr[i]);
		}

        prev = -1;
        for (int i = 0; i < n; i++) {
            if (prev != arr[i]) {
                printf("%d ", arr[i]);
                prev = arr[i];
            }
        }
        printf("$\n");
	}	
}