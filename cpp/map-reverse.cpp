#include <cstdio>
#include <iostream>
#include <map>
#include <string>

using namespace std;
using i64 = long long int;

int main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
	
	map <char, int, std::greater<int> > m;
	string s = "9887766554433332222111111";
	for (auto c: s) {
		m[c]++;
	}

	for (auto& i: m) {
		cout << i.first << ": " << i.second << endl;
	}
    return 0;
}
