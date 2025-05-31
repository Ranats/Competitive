#include <stdio.h>
#define MAX 100

int n, m;
int books[MAX];

int check(mid){
	//	巻号
	int pos = 0;

	//	本棚の段数だけループ
	for (int i = 0; i < n; i++){
		//		printf("i: %d  book : %d\n", i, books[pos]);
		int width = mid;
		for (; pos < m; pos++){
			//	空き幅が本の幅より大きければ格納
			if (width >= books[pos]){
				width -= books[pos];
			}
			else{
				break;
			}
		}
		if (pos >= m){ break; }
	}
	return pos;
}

int bs(left, right){
	int mid = (left + right) / 2;
//	printf("left mid right : %d %d %d\n", left, mid, right);
	if (left >= right){ return mid; }

	//	本棚に収まるか？
	//	pos : 一通り入れ終わった後の巻号インデックス
	//	m   : 巻数 = 最終巻のインデックス
	int pos = check(mid);

	//	本棚に全部収まった => 最後まで入れた -> pos == m
	if (pos >= m){
		return bs(left, mid);		//	左端から中央まで = 本棚の幅を狭める
	}else{	// 入らない
		return bs(mid + 1, right);	//	中央から右端まで = 本棚の幅を広める
	}
}

int main(){
	int i;
//	int books[100];
	int left, right, mid;
	int sum_width;
	
	while (scanf("%d %d",&n,&m), n || m){
		sum_width = 0;
		for (i = 0; i < m; i++){
			scanf("%d", &books[i]);
			sum_width += books[i];
		}

		//	二分探索
		//	ただし、本棚の幅は 1500000 を超えないものとします。
		//	-> 最悪値 = すべて1段に収めた場合 = 本の幅の合計
		left = 1; right = sum_width;
		
		printf("%d\n",bs(left, right));
	}
}
