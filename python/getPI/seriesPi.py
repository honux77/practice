
def getPI(n):
    pi = 0
    i = 0
    while i <= n:
        pi += 4.0 / (i + 1)
        pi -= 4.0 / (i + 3)
        i += 4
    return pi

t = 1000
while t <= 10000 * 10000:
    print("{:6}K {:>10}".format(t//1000, getPI(t)))
    t *= 10
