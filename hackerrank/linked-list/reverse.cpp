Node* Reverse(Node *head)
{
    if (head == nullptr) 
        return head;
   
    Node *next = nullptr;
    Node *prev = nullptr;
    
    while (head != nullptr) {
        next = head -> next;
        head -> next = prev;
        prev = head;        
        head = next;  
    } 
    head = prev;
    
    Node *curr = head;
    return head;
    
}
