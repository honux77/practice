import random
def rand(max):
    return random.randint(0,max)

def doubleRandom():
    return random.uniform(0,1)

def main():
    print("random test")
    for i in range(0,10):
        print("int random:",rand(100))
        print("double random", doubleRandom())

if __name__ == '__main__':
    main()
