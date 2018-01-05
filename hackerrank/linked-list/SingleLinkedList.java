//https://www.hackerrank.com/challenges/insert-a-node-at-a-specific-position-in-a-linked-list/problem

/*
  Insert Node at a given position in a linked list 
  head can be NULL 
  First element in the linked list is at position 0
  Node is defined as 
  class Node {
     int data;
     Node next;
  }
*/
    

Node InsertNth(Node head, int data, int position) {
   // This is a "method-only" submission. 
    // You only need to complete this method.     
    if (head == null || position == 0) {        
        Node n = new Node();        
        n.data = data;
        n.next = head;
        return n;
    }
    
    Node curr = head;    
    for(int i = 0; i < position - 1; i++) {
        curr = curr.next;
    }
    
    Node n = new Node();
    n.data = data;
    n.next = curr.next;
    curr.next = n;
    return head;
}
