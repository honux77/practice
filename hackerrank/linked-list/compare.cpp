// https://www.hackerrank.com/challenges/compare-two-linked-lists/problem
int CompareLists(Node *headA, Node* headB)
{
    while(true) {
        if (headA != nullptr && headB != nullptr) {
            if (headA -> data != headB -> data) {
                return false;            
            } else {
                headA = headA -> next;
                headB = headB -> next;
            }            
        } else if (headA == nullptr && headB == nullptr) {
            return true;
        } else
            return false;
    }
}