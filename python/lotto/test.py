from math import sqrt
from math import pow 
from random import randint
lotto=[0] * 45
devi=[0] * 45
anorm = [False] * 45
for i in range (0, 6 * 600):
	lotto[randint(0,44)] +=1

lotto.sort();
# get average
avg = reduce(lambda x,y: x + y, lotto) / len(lotto)
devi = map(lambda x: (x - avg) ** 2, lotto)
std = sqrt(reduce(lambda x,y: x + y, devi)/len(lotto))
anorm = map(lambda x: True if x - std**2 > 0 else False, devi)
for i in range (0, 45):
	print i,lotto[i], devi[i], anorm[i]
print "avg:", avg, "std: ", std
