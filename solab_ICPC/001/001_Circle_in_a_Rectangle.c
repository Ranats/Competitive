#include <stdio.h>

int main() {
	int w, h, x, y, r;

	scanf("%d %d %d %d %d", &w, &h, &x, &y, &r);

	//	�~�̒��S�� (r,r) �ȏ� (w-r, h-r) �����Ȃ�OK

	if (x < r || y < r || x > w - r || y > h - r) {
		puts("No");
	}
	else {
		puts("Yes");
	}

	return 0;
}