import numpy as np
from mpmath import mp


def comparePI(s):    
    c = 0
    STR_PI = "3.1415926535897932384626433832795028841972"
    v = str(s)
    for i in range(41):
        if STR_PI[i] != v[i]: break
        c += 1
    print(c, str(s)[:41])

def getPI(c):
    mp.dps = 40
    s = mp.mpf(0)    
    n = 1
    while True:        
        if n % 2 == 1:
            s += mp.mpf(1) / (n * 2 - 1)
        else:
            s -= mp.mpf(1) / (n * 2 - 1)
        if n % 1000000 == 0:
            print(n)
            comparePI(s * 4)
        if n == c:
            return s
        n += 1

    

if __name__ == "__main__":
    getPI(1000000000)
