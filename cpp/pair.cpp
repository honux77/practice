#include <iostream>
#include <vector>
#include <utility>

using namespace std;

using vii = vector<pair<int, int>>;

int main() {
	vii a;
	a.push_back(make_pair(1,1));
	auto i = a[0];
	cout << i.first << endl;
	cout << i.second << endl;
	return 0;
}

