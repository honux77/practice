# https://www.hackerrank.com/challenges/delete-duplicate-value-nodes-from-a-sorted-linked-list/problem

def RemoveDuplicates(head):
    if head is None:
        return None
    
    curr = head
    while curr.next is not None:
        currentData = curr.data
        next = curr.next;
        nextData = next.data
        
        if currentData == nextData:
            curr.next = curr.next.next
        else:   
            curr = curr.next    
    return head