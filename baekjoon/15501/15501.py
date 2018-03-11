n=input()
l1 = raw_input().split()
l2 = raw_input().split()

orig = [int(x) for x in l1]
sec = [int(x) for x in l2]

def findIndex(orig, sec):
    for idx in range(n):
        if orig[idx] == sec[0]:
            return idx

def findDirection(orig, sec, idx):     
    if len(orig) == 1 or orig[(idx + 1) % n] == sec[1]:
        return 1
    elif orig[idx - 1] == sec[1]:
        return -1
    else:
        return 0

def solution():        
    idx = findIndex(orig, sec)
    direction = findDirection(orig, sec, idx)
    
    if direction == 0:
        print "bad puzzle"
        return    
        
    for i in sec:        
        if i != orig[idx]:
            print "bad puzzle"
            return                        
        idx += direction 
        idx = idx % n
  
    print "good puzzle"

solution()