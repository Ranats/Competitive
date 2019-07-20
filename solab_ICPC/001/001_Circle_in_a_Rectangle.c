#include <stdio.h>

int main() {
	int w, h, x, y, r;

	scanf("%d %d %d %d %d", &w, &h, &x, &y, &r);

	//	‰~‚Ì’†S‚ª (r,r) ˆÈã (w-r, h-r) –¢–‚È‚çOK

	if (x < r || y < r || x > w - r || y > h - r) {
		puts("No");
	}
	else {
		puts("Yes");
	}

	return 0;
}