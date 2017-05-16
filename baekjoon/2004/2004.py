# https://www.acmicpc.net/problem/2004

# 참고자료: https://ko.wikipedia.org/wiki/%EC%A1%B0%ED%95%A9

def count(n, k):
    c = 0
    while n > 0:
        c += n // k
        n = n // k
    return c

(n,m) = map(int, input().split())
five = count(n, 5) - count(m, 5) - count(n - m, 5)
two = count(n, 2) - count(m, 2) - count(n - m, 2)
print(min(five, two))
