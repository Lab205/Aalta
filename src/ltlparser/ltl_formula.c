/* 
 * 实现LTL Formula相关函数
 * File:   ltl_formula.c
 * Author: yaoyinbo
 *
 * Created on October 20, 2013, 20:19 PM
 */

#include "ltl_formula.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * 动态申请Expression类型
 * @return 
 */
static ltl_formula *allocate_ltl() {
    ltl_formula *ret = (ltl_formula *) malloc(sizeof *ret);

    if (ret == NULL) { //內存申请失败
        fprintf(stderr, "Memory error\n");
        exit(1);
        return NULL;
    }

    memset(ret, 0, sizeof (ltl_formula));

    return ret;
}

/**
 * 动态申请字符串并赋值
 * @param str
 * @return 
 */
static char *allocate_cstr(const char *str) {
    char *s = (char *) malloc((strlen(str) + 1) * sizeof (char));

    if (s == NULL) { //內存申请失败
        fprintf(stderr, "Memory error\n");
        exit(1);
        return NULL;
    }

    strcpy(s, str);
    return s;
}

/**
 * 构建变量表达式
 * @param var 变量名
 * @return 
 */
ltl_formula *create_var(const char *var) {
    ltl_formula *ret = allocate_ltl();

    ret->type = eLITERAL;
    ret->var = allocate_cstr(var);

    return ret;
}

/**
 * 构建操作表达式
 * @param type 
 * @param left
 * @param right
 * @return 
 */
ltl_formula *create_operation(EOperationType type, ltl_formula *left, ltl_formula *right) {
    ltl_formula *ret = allocate_ltl();

    ret->type = type;
    ret->left = left;
    ret->right = right;
    
    return ret;
}

/**
 * ltl公式转string
 * @param root
 * @return 
 */
char *ltl_to_string(ltl_formula *root) {
    if (root == NULL) {
        return allocate_cstr("");
    } else if (root->var != NULL) {
        return allocate_cstr(root->var);
    }
    char *left = ltl_to_string(root->left);
    char *right = ltl_to_string(root->right);
    
    int len = strlen(left);
    char have_left = (len != 0);
    if (have_left) len += 2;
    len += strlen(s_operator[root->type]) + 2;
    len += strlen(right);
    
    char *ret = (char *) malloc((len + 1) * sizeof (char));
    strcpy(ret, "");
    if (have_left) strcat(ret, "(");
    strcat(ret, left);
    if (have_left) strcat(ret, " ");
    strcat(ret, s_operator[root->type]);
    if (strlen(right) != 0) strcat(ret, " ");
    strcat(ret, right);
    if (have_left) strcat(ret, ")");
    
    free(left);
    free(right);
    
    return ret;
}

/**
 * 打印以root为根的表达式树
 * @param root
 */
void print_formula(ltl_formula *root) {
    if (root == NULL) return;
    if (root->var != NULL)
        printf("%s", root->var);
    else if (root->type == eTRUE)
        printf("true");
    else if (root->type == eFALSE)
        printf("false");
    else {
        printf("(");
        print_formula(root->left);
        switch (root->type) {
            case eNOT:
                printf("! ");
                break;
            case eNEXT:
                printf("X ");
                break;
            case eGLOBALLY:
                printf("[] ");
                break;
            case eFUTURE:
                printf("<> ");
                break;
            case eUNTIL:
                printf(" U ");
                break;
            case eRELEASE:
                printf(" R ");
                break;
            case eAND:
                printf(" & ");
                break;
            case eOR:
                printf(" | ");
                break;
            case eIMPLIES:
                printf(" -> ");
                break;
            case eEQUIV:
                printf(" <-> ");
                break;
            default:
                fprintf(stderr, "Error formula!");
        }
        print_formula(root->right);
        printf(")");
    }
}

/**
 * 销毁以root为根的表达式树
 * @param root
 */
void destroy_formula(ltl_formula *root) {
    if (root == NULL) return;

    destroy_formula(root->left);
    destroy_formula(root->right);

    destroy_node(root);
}

/**
 * 销毁节点node，不会递归销毁子节点
 * @param node
 */
void destroy_node(ltl_formula *node) {
    if (node->var != NULL) free(node->var), node->var = NULL;
    free(node), node = NULL;
}
