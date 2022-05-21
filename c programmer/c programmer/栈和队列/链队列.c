//
//  链队列.c
//  c programmer
//
//  Created by 孙旭东 on 2022/5/7.
//

#include <stdio.h>
#include <stdlib.h>

typedef struct QNode {
    int data;
    struct QNode* next;
}QNode;

typedef struct {
    QNode* front;
    QNode* rear;
}LinkQue;

LinkQue* InitQue(void) {
    LinkQue* Q = (LinkQue*)malloc(sizeof(LinkQue));
    QNode* p = (QNode*)malloc(sizeof(QNode));
    Q->front = p;
    Q->rear = p;
    p->next = NULL;
    return Q;
}

void EnQue(LinkQue* Q, int e) {
    QNode* p = (QNode*)malloc(sizeof(QNode));
    p->data = e;
    Q->rear->next = p;
    Q->rear = p;
    p->next = NULL;
}

void DeQue(LinkQue* Q, int* e) {
    QNode* p;
    if (Q->front == Q->rear) {
        printf("ERROR");
        return;
    }
    p = Q->front->next;
    *e = p->data;
    Q->front->next = p->next;
    if (Q->rear == p) {
        Q->rear = Q->front;
    }
    free(p);
}

