#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Node Node;
struct Node {
	int value;
	Node *next;
};

void addFirst(Node **head, int v) {
	Node *newNode = (Node * )malloc(sizeof(Node));
	newNode->value =  v;
	newNode->next = *head;
	*head = newNode;
}

void printList(Node *head) {
	Node *curr = head;
	while (curr != NULL) {
		printf("%d\n", curr->value);
		curr = curr->next;
	}
}

Node *init(int v) {
	Node *head = (Node *)malloc(sizeof(Node));
	head->value = v;
	head->next = NULL;
	return head;
}

int main() {
	Node *head = init(1);
	addFirst(&head, 2);
	addFirst(&head, 3);
	printList(head);
	return 0;
}
