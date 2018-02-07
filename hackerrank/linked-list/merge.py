# https://www.hackerrank.com/challenges/merge-two-sorted-linked-lists/problem

"""
 Merge two linked lists
 head could be None as well for empty list
 Node is defined as
 
 class Node(object):
 
   def __init__(self, data=None, next_node=None):
       self.data = data
       self.next = next_node

 return back the head of the linked list in the below method.
"""

def MergeLists(headA, headB):    
    dummy = Node()    
    tail = dummy
    c1 = headA
    c2 = headB
    
    while c1 is not None or c2 is not None:          
        while c1 is not None and (c2 is None or c1.data <= c2.data):
            tail.next = c1
            c1 = c1.next            
            tail = tail.next
        while c2 is not None and (c1 is None or c2.data <= c1.data):
            tail.next = c2
            c2 = c2.next
            tail = tail.next
    return dummy.next
