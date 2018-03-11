# https://www.hackerrank.com/challenges/detect-whether-a-linked-list-contains-a-cycle/problem

def has_cycle(head):
    curr = head
    strider = curr
    while True:
        if curr is None or strider is None or strider.next is None:
            return False
        if curr == strider:
            return True
        curr = curr.next 
        strider = strider.next.next