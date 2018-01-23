# n = input()
n = 10

arr = range(0, n + 1)
def omin(n):    
    r = 1
    for i in range(2, n):
        r = r * arr[i]
        for j in range (i * 2, n, i):
            if arr[j] % arr[i] == 0:
                arr[j] /= arr[i]  
    return r

print omin(n) % 987654321