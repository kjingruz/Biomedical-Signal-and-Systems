% bonus

%causality

clc;
clear;

numChecks = 1000;
caseSize = 100;
maxRandSize = 100;

isSystem1Causal = checkCausality(numChecks,caseSize,maxRandSize,@system1);
isSystem2Causal = checkCausality(numChecks,caseSize,maxRandSize,@system2);
isSystem3Causal = checkCausality(numChecks,caseSize,maxRandSize,@system3);
