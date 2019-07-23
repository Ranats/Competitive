#include <stdio.h>
#define N 2

typedef struct{
	char name[256];
	int eng;
	int math;
	char gpa;
}db;

void calcgpa(db *arg){
	int sum = arg->eng + arg->math;
	char gpa = 
		(sum >= 90) ? 'S' :
		(sum >= 80) ? 'A' :
		(sum >= 70) ? 'B' :
		(sum >= 60) ? 'C' :	'D';
	arg->gpa = gpa;
}

void calcgpa_p(db *arg){
	for (int i = 0; i < N; i++){
//	while (arg->name != NULL){
//		printf("%s %d %d \n", arg->name, arg->eng, arg->math);
		int sum = arg[i].eng + arg[i].math;
		char gpa =
			(sum >= 90) ? 'S' :
			(sum >= 80) ? 'A' :
			(sum >= 70) ? 'B' :
			(sum >= 60) ? 'C' : 'D';
		arg[i].gpa = gpa;
		//arg++;
	}
}

int main(){
	db grad[N];
	int i;
	printf("name eng math\n");
	for (i = 0; i < N; i++){
		scanf("%s %d %d", &grad[i].name, &grad[i].eng, &grad[i].math);
//		calcgpa(&grad[i]);
	}
	calcgpa_p(&grad);
	for (i = 0; i < N; i++){
		printf("%s %d %d : %c\n", grad[i].name, grad[i].eng, grad[i].math, grad[i].gpa);
	}


}
