a = 7
def some():
    global a
    a += 10 

for _ in range(0,3):
    some()
    print(a)
