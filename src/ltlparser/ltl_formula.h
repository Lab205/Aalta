/* 
 * 定义LTL Formula结构
 * File:   ltl_formula.h
 * Author: yaoyinbo
 *
 * Created on October 20, 2013, 8:22 PM
 */

#ifndef LTL_FORMULA_H
#define	LTL_FORMULA_H

#ifdef	__cplusplus
extern "C" {
#endif

    /* 操作符类型 */
    typedef enum _OperationType {
        eUNDEFINED = 0,
        eTRUE,
        eFALSE,
        eLITERAL,
        eNOT,
        eNEXT,
        eGLOBALLY,
        eFUTURE,
        eUNTIL,
        eRELEASE,
        eAND,
        eOR,
        eIMPLIES,
        eEQUIV
    } EOperationType;
    
    static char s_operator[][4] = {"", "T", "F", "", "¬", "X", "G", "F", "U", "R", "∧", "∨", "->", "<->"};

    /* 表达式树结构定义 */
    typedef struct _ltl_formula {
        EOperationType type;
        struct _ltl_formula *left;
        struct _ltl_formula *right;

        char *var;
    } ltl_formula;

    /* 构建变量表达式 */
    ltl_formula *create_var(const char *var);

    /* 构建操作表达式 */
    ltl_formula *create_operation(EOperationType type, ltl_formula *left, ltl_formula *right);

    /* 打印以root为根的表达式树 */
    void print_formula(ltl_formula *root);

    /* 转为字符串 */
    char *ltl_to_string(ltl_formula *root);

    /* 销毁以root为根的表达式树，生成后必须显式销毁 */
    void destroy_formula(ltl_formula *root);

    /* 销毁节点node，不会递归销毁子节点 */
    void destroy_node(ltl_formula *node);

#ifdef	__cplusplus
}
#endif

#endif	/* LTL_FORMULA_H */

