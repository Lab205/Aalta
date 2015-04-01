#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-MacOSX
CND_DLIB_EXT=dylib
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/main.o \
	${OBJECTDIR}/src/ltlparser/ltl_formula.o \
	${OBJECTDIR}/src/ltlparser/ltllexer.o \
	${OBJECTDIR}/src/ltlparser/ltlparser.o \
	${OBJECTDIR}/src/ltlparser/trans.o

# Test Directory
TESTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}/tests

# Test Files
TESTFILES= \
	${TESTDIR}/TestFiles/f1

# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/aalta

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/aalta: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/aalta ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/main.o: main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main.o main.cpp

${OBJECTDIR}/src/ltlparser/ltl_formula.o: src/ltlparser/ltl_formula.c 
	${MKDIR} -p ${OBJECTDIR}/src/ltlparser
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ltlparser/ltl_formula.o src/ltlparser/ltl_formula.c

${OBJECTDIR}/src/ltlparser/ltllexer.o: src/ltlparser/ltllexer.c 
	${MKDIR} -p ${OBJECTDIR}/src/ltlparser
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ltlparser/ltllexer.o src/ltlparser/ltllexer.c

${OBJECTDIR}/src/ltlparser/ltlparser.o: src/ltlparser/ltlparser.c 
	${MKDIR} -p ${OBJECTDIR}/src/ltlparser
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ltlparser/ltlparser.o src/ltlparser/ltlparser.c

${OBJECTDIR}/src/ltlparser/trans.o: src/ltlparser/trans.c 
	${MKDIR} -p ${OBJECTDIR}/src/ltlparser
	${RM} "$@.d"
	$(COMPILE.c) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ltlparser/trans.o src/ltlparser/trans.c

# Subprojects
.build-subprojects:

# Build Test Targets
.build-tests-conf: .build-conf ${TESTFILES}
${TESTDIR}/TestFiles/f1: ${TESTDIR}/tests/ltlparser_test.o ${OBJECTFILES:%.o=%_nomain.o}
	${MKDIR} -p ${TESTDIR}/TestFiles
	${LINK.cc}   -o ${TESTDIR}/TestFiles/f1 $^ ${LDLIBSOPTIONS} 


${TESTDIR}/tests/ltlparser_test.o: tests/ltlparser_test.cpp 
	${MKDIR} -p ${TESTDIR}/tests
	${RM} "$@.d"
	$(COMPILE.cc) -g -I. -I. -MMD -MP -MF "$@.d" -o ${TESTDIR}/tests/ltlparser_test.o tests/ltlparser_test.cpp


${OBJECTDIR}/main_nomain.o: ${OBJECTDIR}/main.o main.cpp 
	${MKDIR} -p ${OBJECTDIR}
	@NMOUTPUT=`${NM} ${OBJECTDIR}/main.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.cc) -g -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/main_nomain.o main.cpp;\
	else  \
	    ${CP} ${OBJECTDIR}/main.o ${OBJECTDIR}/main_nomain.o;\
	fi

${OBJECTDIR}/src/ltlparser/ltl_formula_nomain.o: ${OBJECTDIR}/src/ltlparser/ltl_formula.o src/ltlparser/ltl_formula.c 
	${MKDIR} -p ${OBJECTDIR}/src/ltlparser
	@NMOUTPUT=`${NM} ${OBJECTDIR}/src/ltlparser/ltl_formula.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.c) -g -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ltlparser/ltl_formula_nomain.o src/ltlparser/ltl_formula.c;\
	else  \
	    ${CP} ${OBJECTDIR}/src/ltlparser/ltl_formula.o ${OBJECTDIR}/src/ltlparser/ltl_formula_nomain.o;\
	fi

${OBJECTDIR}/src/ltlparser/ltllexer_nomain.o: ${OBJECTDIR}/src/ltlparser/ltllexer.o src/ltlparser/ltllexer.c 
	${MKDIR} -p ${OBJECTDIR}/src/ltlparser
	@NMOUTPUT=`${NM} ${OBJECTDIR}/src/ltlparser/ltllexer.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.c) -g -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ltlparser/ltllexer_nomain.o src/ltlparser/ltllexer.c;\
	else  \
	    ${CP} ${OBJECTDIR}/src/ltlparser/ltllexer.o ${OBJECTDIR}/src/ltlparser/ltllexer_nomain.o;\
	fi

${OBJECTDIR}/src/ltlparser/ltlparser_nomain.o: ${OBJECTDIR}/src/ltlparser/ltlparser.o src/ltlparser/ltlparser.c 
	${MKDIR} -p ${OBJECTDIR}/src/ltlparser
	@NMOUTPUT=`${NM} ${OBJECTDIR}/src/ltlparser/ltlparser.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.c) -g -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ltlparser/ltlparser_nomain.o src/ltlparser/ltlparser.c;\
	else  \
	    ${CP} ${OBJECTDIR}/src/ltlparser/ltlparser.o ${OBJECTDIR}/src/ltlparser/ltlparser_nomain.o;\
	fi

${OBJECTDIR}/src/ltlparser/trans_nomain.o: ${OBJECTDIR}/src/ltlparser/trans.o src/ltlparser/trans.c 
	${MKDIR} -p ${OBJECTDIR}/src/ltlparser
	@NMOUTPUT=`${NM} ${OBJECTDIR}/src/ltlparser/trans.o`; \
	if (echo "$$NMOUTPUT" | ${GREP} '|main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T main$$') || \
	   (echo "$$NMOUTPUT" | ${GREP} 'T _main$$'); \
	then  \
	    ${RM} "$@.d";\
	    $(COMPILE.c) -g -Dmain=__nomain -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/ltlparser/trans_nomain.o src/ltlparser/trans.c;\
	else  \
	    ${CP} ${OBJECTDIR}/src/ltlparser/trans.o ${OBJECTDIR}/src/ltlparser/trans_nomain.o;\
	fi

# Run Test Targets
.test-conf:
	@if [ "${TEST}" = "" ]; \
	then  \
	    ${TESTDIR}/TestFiles/f1 || true; \
	else  \
	    ./${TEST} || true; \
	fi

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/aalta

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
