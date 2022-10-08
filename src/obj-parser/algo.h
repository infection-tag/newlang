#ifndef ALGO_H
#define ALGO_H

/* simple tree and node */

typedef struct _treeNode {
	struct _treeNode* nextNodes;
	struct _treeNode* beforeNode;
} treeNode;

typedef struct {
	treeNode* topNodes;
} tree;

/* linked list */

typedef struct _LLNode {
	struct _LLNode* next;
	size_t data;
} LLNode;

typedef struct {
	LLNode* start;
} LinkedList;

#endif /* ALGO_H */
