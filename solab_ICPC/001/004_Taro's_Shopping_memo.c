/*
	���������ۂ���� (ACcepted)
*/

#include <stdio.h>
#define MAX 1000		//	���͂̍ő�T�C�Y
#define LOWER_LIMIT -1	//	�����l
//#define MAX_M 2000000

//	�����p�z��
int dp[MAX][MAX];
int n, m;

//	2���������z�񂩂�ő�l��Ԃ��֐��錾
int getMax(int **source, int width);

int main(void) {
//	int n, m;
	int a[MAX];
	int i, j;
	int v_max;

	//	�������z����֐��ɓn���p�̃|�C���^
	int *dp_p[MAX];
	
	while (1) {
		memset(dp, -1, sizeof(dp));	//	�������e�[�u����-1�ŏ������D�ȉ���For���[�v�Ɠ��`
	//  for (int i = 0; i < MAX_N + 1; i++)
	//    for (int j = 0; j < MAX_W + 1; j++)
	//      dp[i][j] = -1;

		//	n,m �̓���
		scanf("%d %d", &n, &m);

		//	�I������
		if (n == m && n == 0) { break; }
		
		//	a_n �̓���
		for (i = 0; i < n; i++) {
			scanf("%d", &a[i]);
		}

		//	���ׂĂ̑g�ݍ��킹�ɑ΂��ă������e�[�u�����쐬
		for (i = 0; i < n; i++) {
			for (j = 0; j < n; j++) {
				if (i == j || dp[i][j] > 0) { continue; }	//	���ɒT���ς݂̏ꍇ�C�v�Z�����Ȃ��D
				dp[i][j] = a[i] + a[j];
			}
			dp_p[i] = dp[i];
		}

		//	�������e�[�u������ő�l������
		v_max = getMax(dp_p, n);
		if (v_max < 0) {	//	�ő�l���[���ȉ� = ����𖞂����������� (getMax�֐�����max�ϐ��̏����l LOWER_LIMIT ���Ԃ��Ă���)
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

