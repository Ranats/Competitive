#include <stdio.h>
#define TRUE 1
#define FALSE 0

typedef struct {
	char val[100];
	int length;
}string;

int get_length(const char *str){
	int length = 0;
	while (*str++){
		length++;
	}
	return length;
}

string get_s(){
	string input;
	scanf("%s", &input.val);
	input.length = get_length(input.val);

	return input;
}

int solve(string s, string p){
	int i, j;

	for (i = 0; i < s.length + p.length; i++){
		for (j = 0; j < p.length; j++){
			if (s.val[(i + j)%s.length] != p.val[j]){
				break;
			}
			if (j == p.length - 1){
				return TRUE;
			}
		}
	}
	return FALSE;
}

int main(){
	string s, p;

	s = get_s();
	p = get_s();

	(solve(s, p) == 1) ? puts("Yes") : puts("No");
}