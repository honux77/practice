// https://www.hackerrank.com/challenges/find-the-merge-point-of-two-joined-linked-lists/problem

int length(Node *headA) {
    int len = 0;

    while(headA != nullptr) {
        headA = headA->next;        
        len++;
    }
    return len;
}

int FindMergeNode(Node *headA, Node *headB) {
    int lenA = length(headA);
    int lenB = length(headB);

    for (int i = 0; i < lenA - lenB; i++) {
        headA = headA -> next;
    }

    for (int i = 0; i < lenB - lenA; i++) {
        headB = headB -> next;
    }

    while (headA != headB) {
        headA = headA -> next;
        headB = headB -> next;
    }

    return headA -> data;
}
