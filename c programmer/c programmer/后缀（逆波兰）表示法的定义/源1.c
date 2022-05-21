//
//  源.c
//  c programmer
//
//  Created by 孙旭东 on 2022/5/11.
//

#include "源1.h"

char* middleToBack (char *equationMid) {
    char *equationBack;
    char *helpS;
    unsigned long  len = strlen(equationMid);
    equationBack = (char*)malloc(sizeof(char) * (len + 1));
    helpS = (char*)malloc(sizeof(char) * (len + 1));
    int top = -1;
    int i = 0, j = 0;
    for (i = 0; i < len; i++) {
        if (equationMid[i] >= '0' && equationMid[i] <= '9') {
            equationBack[j++] = equationMid[i];
        } else if (equationMid[i] == '(') {
            helpS[++top] = equationMid[i];
        } else if (equationMid[i] == '+' || equationMid[i] == '-') {
            if (helpS[top] == '*' || helpS[top] == '/') {
                while (top >= 0 && helpS[top] != '(') {
                    equationBack[j++] = helpS[top--];
                }
            }
            helpS[++top] = equationMid[i];
        } else if (equationMid[i] == '*' || equationMid[i] == '/') {
            if (helpS[top] == '*' || helpS[top] == '/') {
                while (top >= 0 && helpS[top] != '(') {
                    equationBack[j++] = helpS[top--];
                }
            }
            helpS[++top] = equationMid[i];
        } else if (equationMid[i] == ')') {
            while (top >= 0 && helpS[top] != '(') {
                equationBack[j++] = helpS[top--];
            }
            if (helpS[top] == '(') {
                top--;
            }
        }
    }
    while (top >= 0) {
        equationBack[j++] = helpS[top--];
    }
    equationBack[j] = '\0';
    return equationBack;
}

int calculate (char *equation) {
    unsigned long len = strlen(equation);
    int *helpS = (int*)malloc(sizeof(int) * (len + 1));
    int i = 0;
    int top = -1;
    int temp = 0;
    for (i = 0; i < len; i++) {
        if (equation[i] >= '0' && equation[i] <= '9') {
            helpS[++top] = (int)(equation[i] - '0');
        } else if (equation[i] == '+') {
            temp = helpS[top] + helpS[top - 1];
            helpS[--top] = temp;
        } else if (equation[i] == '-') {
            temp = helpS[top - 1] - helpS[top];
            helpS[--top] = temp;
        } else if (equation[i] == '*') {
            temp = helpS[top] * helpS[top - 1];
            helpS[--top] = temp;
        } else {
            temp = helpS[top - 1] / helpS[top];
            helpS[top] = temp;
        }
    }
    temp = helpS[top];
    free(helpS);
    return temp;
}

int main(void) {
    char equationMid[100];
    char *equationBack;
    scanf("%s", equationMid);
    equationBack = middleToBack(equationMid);
    printf("%d", calculate(equationBack));
    free(equationBack);
}
