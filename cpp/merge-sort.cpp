#include <iostream>
#include <vector>

using namespace std;

static void myMerge(vector<int> &arr, vector<int> &temp, 
		int left, int middle, int right) {
	for (int i = left; i <= right; i++) {
		temp[i] = arr[i];
	}

	int l = left;
	int r = middle + 1;
	int c = left;

	while(l <= middle && r <= right) {
		if(temp[l] <= temp[r]) {
			arr[c] = temp[l];
			l++;
		} else {
			arr[c] = temp[r];
			r++;
		}
		c++;
	}

	int remain = middle - l;
	for (int i = 0; i <= remain; i++) {
		arr[c + i] = temp[l + i];
	}
}

static void _mergesort(vector<int> &a, vector<int> &t, int l, int r) {
    if (l >= r) {
        return;
    }

    int m = (l + r) / 2;
    _mergesort(a, t, l, m); 
    _mergesort(a, t, m + 1, r); 
	myMerge(a, t, l, m, r);
}

void mergesort(vector<int> &a) {
	int n = a.size();
	vector<int> temp(n);
	_mergesort(a, temp, 0, n - 1);
}

int main() {
	ios_base::sync_with_stdio(false);
	cin.tie(nullptr);
	int n;
	cin >> n;
	vector <int> a(n);

	for (int i = 0; i < n ; i++) {
		cin >> a[i];
	}

	mergesort(a);
	for (auto i: a) {
		cout << i << "\n";
	}

	return 0;
}
