#include <iostream>
#include <string>
#include <cstdio>

using namespace std;

//http://jason9319.tistory.com/129
//https://www.geeksforgeeks.org/trie-insert-and-search/

struct Trie {
	Trie *next[9];
	bool term;

	Trie() : term(false) {
		memset(next, 0, sizeof(next));
	}
	~Trie() {
		for(int i = 0;i < 10; i++) {
			if(next[i]) {
				delete next[i];
			}
		}
	}

	void insert(const string &key) {
		Trie *curr = this;
		for (auto c: key) {
			int index = c - '0';
			if (!curr->next[index]) {
				curr->next[index] = new Trie();
			}
			curr = curr->next[index];
		}
		curr->term = true;
	}

	bool find(const string &key) {
		Trie *curr = this;
		for (auto c: key) {
			int index = c - '0';
			if (!curr->next[index]) {
				return false;
			}
			curr = curr->next[index];
		}
		return !curr && curr->term; 
	}
};


int main() {
	string test[] = {"513", "1234", "123"};
	struct Trie *root = new Trie();
	for (int i = 0; i < 3; i++) {
		cout << root->find(test[i]) << endl;
		root->insert(test[i]);
		cout << root->find(test[i]) << endl;
	}
	return 0;
}
