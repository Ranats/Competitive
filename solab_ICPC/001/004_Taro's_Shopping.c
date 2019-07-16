#include <stdio.h>
#define MAX 1000

int main(void) {
	int n , m;
	int d = 0;
	int a[MAX];
	int i, j;
	int v_max;
	int comb;

	while (1) {
		scanf("%d %d", &n, &m);
		if (n == m && n == 0) { break; }

		for (i = 0; i < n; i++) {
			scanf("%d", &a[i]);
		}

		v_max = -1;
		for (i = 0; i < n; i++) {
			for (j = 0; j < n; j++) {
				if (i == j) { continue; }
				comb = a[i] + a[j];
				if ((comb <= m) && (comb > v_max)) { v_max = comb; }
			}
		}

		if (v_max < 0) {
			puts("NONE");
		}
		else {
			printf("%d\n", v_max);
		}
	}
	
	return 0;
}