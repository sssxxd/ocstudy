//
//  main.c
//  c programmer
//
//  Created by 孙旭东 on 2022/5/4.
//

#include <stdio.h>
#include <stdlib.h>

//typedef struct ListNode {
//    int val;
//    struct
//    ListNode* next;
//}List;
//
//List* initList(void) {
//    List* head;
//    head = (List*)malloc(sizeof(List));
//    head->next = NULL;
//    return head;
//}
//
//void creatList(List* head) {
//    int val;
//    List* p = head;
//    List* s;
//    printf("请输入链表（-1停止输入）");
//    while (1) {
//        scanf("%d", &val);
//        if (val == -1) {
//            break;
//        }
//        s = (List*)malloc(sizeof(List));
//        s->val = val;
//        p->next = s;
//        p = p->next;
//    }
//    p->next = NULL;
//}
//
//void putOut(List* head) {
//    List* p = head->next;
//    while (p) {
//        printf("%d ", p->val);
//        p = p->next;
//    }
//}
//
//struct ListNode* removeNthFromEnd(struct ListNode* head, int n) {
//    struct ListNode *dummy = (struct ListNode*)malloc(sizeof(struct ListNode));
//    //建立一个哑节点当临时的头节点
//    struct ListNode *first = head;
//    struct ListNode *second = dummy;
//    //设立时快指针比慢指针向前一格
//    struct ListNode *ans;
//    struct ListNode *per;
//    int i = 0;
//    dummy->next = head;
//    while(first) {
//        if (i < n) {
//            first = first->next;
//            i++;
//        } else {
//            first = first->next;
//            second = second->next;
//        }
//    }
//    per = second->next;
//    second->next = second->next->next;
//    free(per);
//    //删除节点
//    ans = dummy->next;
//    free(dummy);
//    return ans;
//}
//
//int main(void) {
//    List* head = initList();
//    int e;
//    creatList(head);
//    printf("请输入要删除的节点参数:");
//    scanf("%d", &e);
//    head->next = removeNthFromEnd(head->next, e);
//    putOut(head);
//}
