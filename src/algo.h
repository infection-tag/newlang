#ifndef ALGO_H
#define ALGO_H

/* simple tree and node */

typedef struct {
	treeNode* nextNodes;
	treeNode* beforeNode;
} treeNode;

typedef struct {
	treeNode* topNodes;
} tree;

/* linked list */

typedef struct {
	LLNode* next;
	size_t data;
} LLNode;

typedef struct {
	LLNode* start;
} LinkedList;

#endif /* ALGO_H */
