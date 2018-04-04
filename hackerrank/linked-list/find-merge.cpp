// https://www.hackerrank.com/challenges/find-the-merge-point-of-two-joined-linked-lists/problem

#include <iostream>

struct Node
{
    int data;
    Node* next;
};

Node* findSameNode(Node *headA, Node *headB) {    
    Node *currB = headB;
    if (headA == nullptr) {
        return nullptr;
    }
    while(currB != nullptr) {
        if (headA == currB) {
            return headA;
        } else {
            currB = currB -> next;
        }        
    }
    return nullptr;
}

int FindMergeNode(Node *headA, Node *headB)
{
    // Complete this function
    // Do not write the main method. 
    Node *currA = headA;        
    Node *currB = headB;
    while(true) {
        Node *find = findSameNode(currA, currB);
        if (find != nullptr) {
            return find -> data;
        }
        currA = currA -> next;
        currB = currB -> next;
    }    
}
