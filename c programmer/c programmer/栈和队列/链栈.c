//
//  链栈.c
//  c programmer
//
//  Created by 孙旭东 on 2022/5/7.
//

#include <stdio.h>
#include <stdlib.h>

typedef struct StackNode {
    int data;
    struct StackNode* next;
}StackNode;

typedef struct {
    StackNode* top;
    int count;
}LinkStack;

LinkStack* initStack(void) {
    LinkStack* S = (LinkStack*)malloc(sizeof(LinkStack));
    S->top = NULL;
    S->count = 0;
    return S;
}

void Push(LinkStack* S, int e) {
    StackNode* s = (StackNode*)malloc(sizeof(StackNode));
    s->data = e;
    s->next = S->top;
    S->top = s;
    S->count++;
}

void Pop(LinkStack* S, int* e) {
    StackNode* p;
    if (S == NULL || S->top == NULL) {
        printf("ERROR");
        return;
    }
    *e = S->top->data;
    p = S->top;
    S->top = p->next;
    free(p);
    S->count--;
}

