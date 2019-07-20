#include <stdio.h>
#define TRUE 1		//	Trueフラグ
#define FALSE 0		//	Falseフラグ

//	文字列型 (構造体) (typedef宣言)
typedef struct {
	char val[100];	//	中身
	int length;		//	文字数
}string;

int get_length(const char *str);	//	文字数をカウント, 格納する関数
string get_s();						//	入力関数
int solve(string s, string p);		//	ソルバー

int main(){
	string s, p;

	s = get_s();		//	s と p を入力
	p = get_s();

	(solve(s, p) == 1) ? puts("Yes") : puts("No");	//	ソルバに渡して，返ってきた値が1=>Yes, 0=>No．
}

int get_length(const char *str){
	int length = 0;
	while (*str++){
		length++;
	}
	return length;
}

string get_s(){
	string input;							//	一時変数
	scanf("%s", &input.val);				//	入力を文字列型の中身を表す.valに格納
	input.length = get_length(input.val);	//	文字数をget_length関数で取得．返ってきたint型数値を.lengthに格納

	return input;			//	一時変数に格納した文字列型 = 入力された文字とその文字数をもつ構造体 を返す
}

int solve(string s, string p){
	int i, j;

	for (i = 0; i < s.length + p.length; i++){			//	s+pの文字数分だけ1文字ずつ比較する．
		for (j = 0; j < p.length; j++){					//	s[i+0]とp[0]を比較 -> s[i+1]とp[1]を比較 -> ...
			if (s.val[(i + j)%s.length] != p.val[j]){	//	文字が一致しなければ，位置(s[i])をひとつ右にずらす(i++)
				break;
			}
			if (j == p.length - 1){						//	j==pの文字数 => pの最後の文字まで全部一致している．
				return TRUE;
			}
		}
	}
	return FALSE;	//	for文が全部回る => 最後まで一致することなくs+pの文字数分だけ照合が終了した．
}
