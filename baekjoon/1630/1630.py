n = input()

def gcd(m, n):
    while True:
        m %= n
        if m == 0:
            return n
        n %= m
        if n == 0:
            return m

def lcm(m, n):
    g = gcd(m ,n)
    return m * n / g

def omin(n):    
    r = n
    for i in range(2, n):
        if r % i != 0:            
            r = lcm(r, i)
    return r

print omin(n)