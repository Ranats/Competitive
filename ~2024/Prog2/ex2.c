#include <stdio.h>
#define N 2
//#define arch(i) ['S','A','B','C','D'][i]

typedef struct{
	char name[256];
	int eng;
	int math;
	char gpa;
}db;

void calcgpa(db *arg){
	int avg = (arg->eng + arg->math) / 2;
	char gpa = 
		(avg >= 90) ? 'S' :
		(avg >= 80) ? 'A' :
		(avg >= 70) ? 'B' :
		(avg >= 60) ? 'C' :	'D';

	arg->gpa = gpa;
}

void calcgpa_p(db *arg){
	for (int i = 0; i < N; i++){
		calcgpa(&arg[i]);
	}
}

int main(){
	db grad[N];
	int i;
	printf("     name eng math\n");
	for (i = 0; i < N; i++){
		printf("%d : ", i+1);
		scanf("%s %d %d", &grad[i].name, &grad[i].eng, &grad[i].math);
//		calcgpa(&grad[i]);
	}
	calcgpa_p(&grad);

	for (i = 0; i < N; i++){
		printf("%s %d %d : %c\n", grad[i].name, grad[i].eng, grad[i].math, grad[i].gpa);
	}
}
