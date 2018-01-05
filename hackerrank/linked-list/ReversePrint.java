/*
  Print elements of a linked list in reverse order 
  head pointer input could be NULL as well for empty list
  Node is defined as 
  class Node {
     int data;
     Node next;
  }
*/
    // This is a "method-only" submission. 
    // You only need to complete this method. 

    void ReversePrint(Node head) {
        _print(head);
    }
    
    void _print(Node head) {
        if(head == null) {
            return;
        }
        _print(head.next);
        System.out.println(head.data);
    }