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

		// �񕪒T���ŕ������߂�
		int low = 1, high = 1500000, mid = -1, prev;
		while (true){
			prev = mid;
			mid = (low + high) / 2;
			// �O�Ɠ������ʂ̂Ƃ�
			if (prev == mid) break;

			// pos := ���߂����{�̔ԍ�
			// v[pos] := pos �Ԗڂ̖{�̌���
			int pos = 0;
			// �i�� m �������[�v���Ė{�I�Ɏ��܂�����̖{�����߂Ă���.
			for (int i = 0; i < m; i++){
				// width := m �i�ڂ̎c��̖{�I�̕�
				int width = mid;
				while (true){
					if (width >= v[pos]){ // �{�����܂�Ƃ�
						width -= v[pos];
						pos++;
						// ���ׂĂ̖{�����߂���
						if (pos >= v.size()) break;
					}
					else{ // �{�����܂�Ȃ��Ƃ�
						break;
					}
				}
				// ���ׂĂ̖{�����߂���
				if (pos >= v.size()) break;
			}
			// ���ׂĂ̖{�����߂���
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