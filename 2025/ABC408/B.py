import io
import sys

_INPUT = """\
8
19 5 5 19 5 19 4 19

"""
sys.stdin = io.StringIO(_INPUT)

N = int(input())
A = sorted(list(set(map(int, input().split()))))

print(len(A))
print(*A)