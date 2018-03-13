Node* RemoveDuplicates(Node *head)
{
    if(head == nullptr)
        return nullptr;
    
    if(head->next == nullptr)
        return head;
    
    if(head->data != head->next->data)
    {
        head->next = RemoveDuplicates(head->next);
        return head;
    }

    return RemoveDuplicates(head->next);
}