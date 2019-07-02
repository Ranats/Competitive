#include <stdio.h>

int gcd(a, b){
	if (a < b){ return gcd(b, a); }
	unsigned r;
	while ((r = a%b)){
		a = b;
		b = r;
	}

	return b;
}

int main(){
	int w, h, c;
	int total = 0;
	int g;

	scanf("%d %d %d", &w, &h, &c);

	g = gcd(w, h);
	total = (w / g) * (h / g) * c;
	printf("%d\n", total);

}