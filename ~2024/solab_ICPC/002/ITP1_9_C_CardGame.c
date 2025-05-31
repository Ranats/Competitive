#include <stdio.h>
int strcmp(const char *a, const char *b){

//	printf("%s %s", a, b);
//	printf("%c %c", *a, *b);

	while (*a == *b && *a && *b){
//		printf("%c %c", *a, *b);
		*a++;
		*b++;
		//if (*a == "\n"){ return -1; }
		//if (*b == "\n"){ return 1; }
	}

	return  (*a == *b) ? 0 : (*a > *b) ? -1 : 1;

//	if (*a == *b){ return 0; }
//	return (*a > *b) ? 1 : -1;
//	return 0;
}

int main(){
	int n;
	int i;

	int taro=0, hanako =0;
	char a[100], b[100];

	//	カードの数 n の入力 / n行の入力が続く 
	scanf("%d", &n);

	for (i = 0; i < n; i++){
		scanf("%s %s", &a, &b);
	//	printf("%s, %s", a,b);
	//	printf("%d", strcmp(a, b));
		switch (strcmp(a, b)){
		case  0: taro += 1; hanako += 1; break;
		case -1: taro += 3; break;
		case  1: hanako += 3; break;
		}
	}
	
	printf("%d %d\n", taro, hanako);
	return 0;
}