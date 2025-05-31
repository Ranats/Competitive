N = int(input())

A = list(map(int,input().split()))

total = sum(A)
squared_sum = 0
for x in A:
    squared_sum += x * x

result = (total * total - squared_sum) // 2

print(result)