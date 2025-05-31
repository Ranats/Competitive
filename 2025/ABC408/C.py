import io
import sys
import random

_INPUT = """\
5 2
1 2
3 4
"""

# N = 10 ** 6
# M = 2 * (10 ** 5)
# _input = [0] * (M+1)
# _input[0] = f"{N} {M}"

# for i in range(M):
#     _input[i+1] = f"{random.randint(1,N)} {random.randint(1,N)}"

sys.stdin = io.StringIO(_INPUT)

print("get_set")
N, M = map(int, input().split())
#battery = {"LR" : "00"} * M
#battery = ([set(map(int, input().split())) for _ in range(M)])
# battery = set()
# for _ in range(M):
#     L, R = map(int, input().split())
#     battery.add((L, R))

from collections import Counter

battery = [tuple(map(int, input().split())) for _ in range(M)]
count_dict = Counter(battery)

#L, R = [0] * M , [0] * M
#for i in range(M):
#    L[i], R[i] = map(int, input().split())

# 方針
#   各壁にIDを振り，その壁が何個の砲台に守られているかの個数を計算する．
#   最もその数が少ない壁に対して，守っている砲台の数を出力する．
# 制約
#   1 <= N <= 10^6
#   1 <= M <= 2 * 10^5
#   N > M なので，Mに対してループ回した方が早そう
#   でも最悪ケースで，砲台が守る範囲が 1-N だったら結局その大きさループさせなきゃな気がする
#   その砲台が沢山あった場合，無駄が大きい
#   ➠ 壁に対してループさせた方が良いかも

wall = [0] * (N+1)

for i in count_dict:
    l,r = i[0]-1, i[1]-1
    count = count_dict[i]
    wall[l] += count
    wall[r + 1] -= count

for i in range(1,N):
    wall[i] += wall[i-1]
wall.pop()

#print(wall)

# for j in range(M):
#     for k in range(L[j], R[j]+1):
#         wall[k-1] += 1

print(min(wall))
#exit()

print(wall)

for i in range(N):
    print(f"  {i+1}  ", end = "")
print()
for i in range(N):
    print(f"  {wall[i]}  ", end = "")
print()
for i in range(N):
    print("|---|",end = "")

print()

for (L,R), count in count_dict.items():
    flg = False
    for j in range(5*N):
        j = (j // 5) + 1
        if L == j and not flg:
            print(f"{count}", end="")
            flg = True
            continue
        if R == j:
            print(f"----{count}", end="")
            break
        if flg:
            print("-", end="")
        else:
            print(" ", end="")
    print()
exit()

for i in range(M):
    flg = False
#    print(f"L[{i}] : {L[i]} {R[i]}")
    for j in range(5*N):
        j = (j // 5) + 1
        if L[i] == j and not flg:
            print(f"{i}", end="")
            flg = True
            continue
        if R[i] == j:
            print(f"----{i}", end="")
            break
        if flg:
            print("-", end="")
        else:
            print(" ", end="")
    print()