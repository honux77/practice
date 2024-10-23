import random

def randomPi(t):
    c = 0
    for _ in range(t):
        x = random.random()
        y = random.random()
        if x**2 + y**2 <= 1:
            c += 1
    return 4 * c / t

t = 1000
while t <= 10000 * 1000:
    print("{:6}K {:>10}".format(t//1000, randomPi(t)))
    t *= 10
