/*
Insert Node in a doubly sorted linked list
After each insertion, the list should be sorted
Node is defined as

struct Node
{
int data;
Node *next;
Node *prev;
}
*/

# include "stdafx.h"
#include <iostream>
#include "SortedInsert.h"


Node* SortedInsert(Node *head, int data)
{
	Node *node = new Node();
	node->data = data;

	if (head == nullptr) {
		return node;
	}
	else if (head ->data > data) {
		node -> next = head;
		return node;
	}

	Node *curr = head;	
	while (curr->next != nullptr) {
		if (curr->next->data > data) {
			break;
		}
		curr = curr->next;
	}
	node->next = curr->next;
	curr->next = node;
	return head;
}

void printList(Node *head) {
	while (head != nullptr) {
		std::cout << head->data << "->";
		head = head->next;
	}
	std::cout << "END" << std::endl;
}