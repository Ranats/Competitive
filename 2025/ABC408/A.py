# 入力テスト用
# import io
# import sys

# _INPUT = """\
# 10 22
# 47 81 82 95 117 146 165 209 212 215

# """
# sys.stdin = io.StringIO(_INPUT)

# 入力
#   A, B = C, D
#       アンパック代入：カンマ区切りでイコールの左と右に書くと，
#       それぞれ対応した変数に代入することができる
#
#   map(処理, 処理対象(コレクションなど))
#   処理対象のコレクションの全ての要素に対し，処理を実行する
#
#   list(map...)
#       右側は複数あり，左側は1つ．リストとして格納してほしいので，リストに変換してる

N, S = map(int,input().split())
T = list(map(int,input().split()))

#   最後に長老を叩いた時刻 t
tap = 0

#   叩いたリスト T から1つずつ取り出して繰り返す for 文
for i in T:
    #   もし「i (叩いた時刻) - tap (最後に長老を叩いた時刻)」＝ 叩いてからの経過時間
    #   が，S + 0.5 よりも大きい＝長ければ（入力は整数なので，+0.5は不要かも）
    if i - tap > S + 0.5:
        #   No と表示し，プログラムを終了する(exit()関数により強制終了)
        print("No")
        exit()
    #   そうでなければ，最後に叩いた時刻を更新する．
    tap = i

#   最後まで無事叩けたらループが終了するので，”Yes"と出力．
print("Yes")



#   コメントなしVer.
N, S = map(int,input().split())
T = list(map(int,input().split()))

tap = 0
for i in T:
    if i - tap > S + 0.5:
        print("No")
        exit()
    tap = i

print("Yes")
