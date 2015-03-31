/* 
 * File:   main.cpp
 * Author: snowingsea
 *
 * Created on March 31, 2015, 4:54 PM
 */

#include <cstdlib>
#include <string>
#include "src/ltlparser/trans.h"

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    ltl_formula *ltl = getAST("! b");
    char *str = ltl_to_string(ltl);
    printf("%s", str);
    free(str);

    return 0;
}

