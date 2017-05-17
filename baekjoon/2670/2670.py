# input
num = int(input())
arr = []
for _ in range(n):
    arr.append(int(input))

# solution
max_mul = 0
arr_t = arr[:]
for i in range(len(arr) - 1):
    for j in range(len(arr) - 1 - i):
        arr_t[j] = arr_t[j] * arr[j + i + 1]
        max_mul = max(max_mul, arr_t[j])

# print result
max_mul = math.floor(max_mul * 1000 + 0.5) / 1000
print(max_mul)
