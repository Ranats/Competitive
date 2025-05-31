#include <stdio.h>
#define MAX 10000

int main() {
	int n;
	int a[MAX];
	int i;
	double avg;
	int count[MAX];
	int c_i = 0;

	while (1) {
		scanf("%d", &n);
		if (n == 0) { break; }

		avg = 0;
		count[c_i] = 0;

		for (i = 0; i < n; i++) {
			scanf("%d", &a[i]);
			avg += a[i];
		}
		avg /= n;

		for (i = 0; i < n; i++) {
			if (a[i] <= avg) { count[c_i]++; }
		}

		c_i++;
	}

	for (i = 0; i < c_i; i++) {
		printf("%d\n", count[i]);
	}
}