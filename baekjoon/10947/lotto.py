import random

a = range(1, 46)
random.shuffle(a)
mine = a[:6]
mine.sort()
print " ".join(str(i) for i in mine)