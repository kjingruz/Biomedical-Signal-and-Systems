clc;
clear;

numChecks = 1000;
caseSize = 100;
maxRandSize = 100;

isSystem0Linear = checkLinearity(numChecks,caseSize,maxRandSize,@system0);
isSystem1Linear = checkLinearity(numChecks,caseSize,maxRandSize,@system1);
isSystem2Linear = checkLinearity(numChecks,caseSize,maxRandSize,@system2);
isSystem3Linear = checkLinearity(numChecks,caseSize,maxRandSize,@system3);