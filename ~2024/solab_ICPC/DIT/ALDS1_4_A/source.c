#include <stdio.h>

int check(int target, int arr[],int n){
	for (int i = 0; i < n; i++){
		if (target == arr[i]){
			return 1;
		}
	}
	return 0;
}

int main(){
	int n, q;
	int s[10000], t[500];
	int count = 0;

	scanf("%d", &n);

	for (int i = 0; i < n; i++){
		scanf("%d",& s[i]);
	}

	scanf("%d", &q);

	for (int i = 0; i < q; i++){
		scanf("%d", &t[i]);
	}

	for (int i = 0; i < q; i++){
		count += check(t[i], s, n);
	}

	printf("%d\n", count);
}
