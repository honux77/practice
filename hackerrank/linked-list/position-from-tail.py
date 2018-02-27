# https://www.hackerrank.com/challenges/get-the-value-of-the-node-at-a-specific-position-from-the-tail/

def GetNode(head, position):
    curr = head
    tail = head
    for i in range(position):
        tail = tail.next
    while tail.next is not None:
        curr = curr.next
        tail = tail.next
    return curr.data