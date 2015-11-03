#if the name of this file is random.py, it is impossible to import random module
#please be careful

import random

#demo1, generate random integer
print("1.generate random nuber")
for i in range(0,10):
    print("random number:", random.randint(100,107))


#demo2 shuffle list
print("2. shuffle list")
numList = list(range(0,10))
random.shuffle(numList)
print(numList)

#demo3 choose one
print("3. choose random object from list")
numList2 = range(1,10)
for i in range(0,10):
    print("My Choice: ", random.choice(numList2))
