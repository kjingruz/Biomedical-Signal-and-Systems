
clc;
clear;

numChecks = 1000;
caseSize = 100;
maxRandSize = 100;

isSystem1Memory = checkMemory(numChecks,caseSize,maxRandSize,@system1);
isSystem2Memory = checkMemory(numChecks,caseSize,maxRandSize,@system2);
isSystem3Memory = checkMemory(numChecks,caseSize,maxRandSize,@system3);