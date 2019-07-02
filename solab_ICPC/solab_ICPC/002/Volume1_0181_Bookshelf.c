#include <iostream>
#include <vector>
using namespace std;

int main(){
	int n, m;
	while (cin >> m >> n, n || m){
		vector<int> v(n);
		for (int i = 0; i < n; i++){
			cin >> v[i];
		}

		// 二分探索で幅を求める
		int low = 1, high = 1500000, mid = -1, prev;
		while (true){
			prev = mid;
			mid = (low + high) / 2;
			// 前と同じ結果のとき
			if (prev == mid) break;

			// pos := 収めたい本の番号
			// v[pos] := pos 番目の本の厚さ
			int pos = 0;
			// 段数 m だけループして本棚に収まる厚さの本を収めていく.
			for (int i = 0; i < m; i++){
				// width := m 段目の残りの本棚の幅
				int width = mid;
				while (true){
					if (width >= v[pos]){ // 本が収まるとき
						width -= v[pos];
						pos++;
						// すべての本を収めた時
						if (pos >= v.size()) break;
					}
					else{ // 本が収まらないとき
						break;
					}
				}
				// すべての本を収めた時
				if (pos >= v.size()) break;
			}
			// すべての本を収めた時
			if (pos >= v.size()){
				high = mid + 1;
			}
			else{
				low = mid - 1;
			}
		}
		cout << mid + 1 << endl;
	}
}