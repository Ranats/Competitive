#include <stdio.h>
#include <math.h>
#define N 10
#define M_PI 3.1415926535

int main(){
	double sine;
	double rad;
	int deg;
	double y;

	FILE *fp;

	fopen("data.csv", "w");
	for (deg = 0; deg <= 360; deg += N){
		rad = deg * (M_PI / 180);
		y = sin(rad);
		printf("sin(%d) = %f\n", deg, y);
		fprintf(fp, "%f,", y);
	}

	fclose(fp);
}
