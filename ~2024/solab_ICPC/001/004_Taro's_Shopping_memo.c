/*
	メモ化っぽいやつ (ACcepted)
*/

#include <stdio.h>
#define MAX 1000		//	入力の最大サイズ
#define LOWER_LIMIT -1	//	下限値
//#define MAX_M 2000000

//	メモ用配列
int dp[MAX][MAX];
int n, m;

//	2次元正方配列から最大値を返す関数宣言
int getMax(int **source, int width);

int main(void) {
//	int n, m;
	int a[MAX];
	int i, j;
	int v_max;

	//	多次元配列を関数に渡す用のポインタ
	int *dp_p[MAX];
	
	while (1) {
		memset(dp, -1, sizeof(dp));	//	メモ化テーブルを-1で初期化．以下のForループと同義
	//  for (int i = 0; i < MAX_N + 1; i++)
	//    for (int j = 0; j < MAX_W + 1; j++)
	//      dp[i][j] = -1;

		//	n,m の入力
		scanf("%d %d", &n, &m);

		//	終了判定
		if (n == m && n == 0) { break; }
		
		//	a_n の入力
		for (i = 0; i < n; i++) {
			scanf("%d", &a[i]);
		}

		//	すべての組み合わせに対してメモ化テーブルを作成
		for (i = 0; i < n; i++) {
			for (j = 0; j < n; j++) {
				if (i == j || dp[i][j] > 0) { continue; }	//	既に探索済みの場合，計算をしない．
				dp[i][j] = a[i] + a[j];
			}
			dp_p[i] = dp[i];
		}

		//	メモ化テーブルから最大値を検索
		v_max = getMax(dp_p, n);
		if (v_max < 0) {	//	最大値がゼロ以下 = 制約を満たす解が無い (getMax関数内のmax変数の初期値 LOWER_LIMIT が返ってくる)
			puts("NONE");
		}
		else {
			printf("%d\n", v_max);
		}
	}
	
	return 0;
}

int getMax(int **source, int width) {
	int i, j;
	int max = LOWER_LIMIT;
	for (i=0; i < width; i++) {
		for (j=0; j < width; j++) {
//			printf("dp[%d][%d] : %d\n", i, j, source[i][j]);
			if (source[i][j] > max && source[i][j] <= m) { max = source[i][j]; }
		}
	}
	return max;
}

