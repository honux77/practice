#include <cstdio>
#include <iostream>
#include <vector>

using namespace std;
using i64 = long long int;

int main()
{
	vector<int> nums;
	for (int i = 0; i < 10; i++) {
		nums.push_back(2 * i + 1);
	}

	for (int i = 0; i < 10; i++) {
		printf("%d\n", nums[i]);
	}
    return 0;
}
