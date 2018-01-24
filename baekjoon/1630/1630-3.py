n = input()
# n = 10

divs = range(0, n + 1)
def omin(n):    
    r = 1
    for i in range(2, n + 1):
        if (divs[i] == 1):
            continue
        # r = (r * divs[i]) % 987654321
        r = (r * divs[i]) % 987654321
        for j in range (i * 2, n + 1, i):
            if divs[j] % divs[i] == 0:
                divs[j] /= divs[i]  
    return r

print omin(n) 