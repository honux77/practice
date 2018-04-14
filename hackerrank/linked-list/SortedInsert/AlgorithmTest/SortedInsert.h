#pragma once

struct Node
{
	int data;
	Node *next;
	Node *prev;
};

Node* SortedInsert(Node *head, int data);
void printList(Node *head);