N, M = map(int, input().split())

A = list(map(int, input().split()))

i = 0

while(len(set(A)) == M):
    A.pop()
    i += 1

print(i)