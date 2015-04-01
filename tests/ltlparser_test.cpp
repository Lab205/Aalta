/* 
 * File:   ltlparser_test.cpp
 * Author: snowingsea
 *
 * Created on Apr 1, 2015, 1:53:58 AM
 */

#include <stdlib.h>
#include <iostream>
#include <stdio.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string>
#include <string.h>

#include "../src/ltlparser/trans.h"

#define MAXBUFSIZE 1024

/*
 * Simple C++ Test Suite
 */

void test1() {
    std::cout << "ltlparser_test test 1" << std::endl;
}

void test2() {
    std::cout << "ltlparser_test test 12" << std::endl;
    std::cout << "%TEST_FAILED% time=0 testname=test12 (ltlparser_test) message=error message sample" << std::endl;
}

#define DIR_PATH        "tests/testcase/ltlparser/"

void read_line(FILE *fp, char *str) {
    str[0] = '\0';
    while (!feof(fp)) {
        fgets(str, MAXBUFSIZE, fp);
        int len = strlen(str);
        if (len > 0 && str[len -1] == '\n')
            str[len - 1] = '\0';
        if (str[0] == '\0') continue;
        break;
    }
}

//void testcase(FILE *fp, )

void test(char *testname) {
    int len = strlen(DIR_PATH) + strlen(testname) + 1;
    char *str = (char *) malloc(len * sizeof (char));
    strcpy(str, DIR_PATH);
    strcat(str, testname);
    FILE *fp = fopen(str, "r");
    free(str);
    if (fp == NULL) return;

    char in[MAXBUFSIZE];
    char ans[MAXBUFSIZE];
    int count = 1;
    while (true) {
        read_line(fp, in);
        if (in[0] == '\0') break;
        read_line(fp, ans);
        if (ans[0] == '\0') break;
        std::cout << "%TEST_STARTED% " << testname << count << " (ltlparser_test)" << std::endl;

        ltl_formula *ltl = getAST(in);
        char *out = ltl_to_string(ltl);
        if (strcmp(out, ans) != 0) {
            std::cout << "%TEST_FAILED% time=" << 0 
                    << " testname=" << testname << count 
                    << " (ltlparser_test) message=" << "(ans:)-" << ans << "-\t\t(out:)-" << out << "-"
                    << std::endl;
        }
        
        std::cout << "%TEST_FINISHED% time=" << 0 << " " 
                << testname << count << " (ltlparser_test)" << std::endl;
        count++;
        free(out);
    }
    fclose(fp);
}

void test_all() {
    struct dirent* ent = NULL;
    DIR *pDir;
    pDir = opendir(DIR_PATH);
    if (pDir == NULL) return;
    while (NULL != (ent = readdir(pDir))) {
        if (ent->d_type == 8) { // file
            test(ent->d_name);
        }
    }
}

int main(int argc, char** argv) {
    std::cout << "%SUITE_STARTING% ltlparser_test" << std::endl;
    std::cout << "%SUITE_STARTED%" << std::endl;

    test_all();
    
    std::cout << "%SUITE_FINISHED% time=10" << std::endl;

    return (EXIT_SUCCESS);
}

