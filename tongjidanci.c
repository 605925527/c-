#include <stdio.h>
#include <stdlib.h>

#define longest_size  32

struct binary_tree {
	char str[longest_size];
	int count;
	struct binary_tree *left;
	struct binary_tree *right;
};

typedef struct binary_tree node;

enum BOOL {
	NO,
	YES
};

typedef enum BOOL BOOL;

BOOL cmp(const char *s, const char *t)
{
	int ret = 0;

	while( !(ret = *(unsigned char *)s - *(unsigned char *)t))
	{
		if(*s == '\0')
			return YES;
		s++;
		t++;
	}
	if(ret) 
		return NO;
	else 
		return YES;
}

void mycpy(char *s, char *t)
{
	if((s==NULL)||(t==NULL))
		return;
	while((*s++ = *t++) != '\0')
		;
}

void insert(node **tree, char *val)
{
	node *temp = NULL;
	if(!(*tree)) {
		temp = (node *)malloc(sizeof(node));
		temp->left = temp->right = NULL;
		//temp->str = val;
		mycpy(temp->str, val);
		temp->count = 1;
		*tree = temp;
		return;
	}

	if(cmp(val, (*tree)->str)) {
		(*tree)->count ++;
//	} else if(cmp(val, (*tree)->str)) {
//		insert(&(*tree)->right, val);
	} else {
		insert(&(*tree)->left, val);
	}

}
void deltree(node *tree)
{
	if(tree) {
		deltree(tree->left);
		deltree(tree->right);
		free(tree);
	}
}

void print_inorder(node *tree)
{
	if(tree) {
		print_inorder(tree->left);
		printf("%s\t\t\tcount[%d]\n", tree->str, tree->count);
		print_inorder(tree->right);
	}
}

int main(void)
{
	node *root;
	node *tmp;

	root = NULL;
	insert(&root, "hello");
	insert(&root, "hey");
	insert(&root, "hello");
	insert(&root, "ok");
	insert(&root, "hey");
	insert(&root, "hey");
	insert(&root, "hey");


	print_inorder(root);

	deltree(root);
}


