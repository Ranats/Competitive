N, M = map(int, input().split())

A = list(map(int,input().split()))

exist = [False] * M

ans = 0

while(True):
    for i in range(1,M+1):      # range:１からM+1 までの範囲で(rangeオブジェクトを生成してる)
                                #for:繰り返して iに1️からM+1を順に格納
        if(i in A):     # Aの中にiがあるとき
            exist[i-1] = True
        else:           # Aの中にiが無いとき
            exist[i-1] = False

    # existがどうなってるか確認用
    print(f"A:{A}")
    print(exist)

    #終了条件
    if(False in exist):
        break

    # リストの一番後ろを取り出す
    A.pop()
    ans += 1

print(f"A:{A}")
print(f"exist:{exist}")
print(f"ans:{ans}")