#include <iostream>
#include <string>
#include <unordered_map>


using namespace std; 
using mymap = unordered_map<string, int>;

int main() {
	mymap s;

	//insert 1
	s["apple"] = 20;
	s["banana"] = 30;

	//insert 2
	s.insert(make_pair("carrot", 40));

	auto itr = s.find("apple");
	if(itr != s.end()) {
		cout << itr->first << endl;
		cout << itr->second << endl;
	}
	return 0;
}
