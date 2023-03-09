clc;
clear;

numChecks = 1000; % number of test cases used per system per property 
caseSize = 100; % length of test cases
maxRandSize = 100; % max rand integer size

% Testing for properties in system0
isSystem0Causal = checkCausality(numChecks,caseSize,maxRandSize,@system0)
isSystem0Memoryless = checkMemoryless(numChecks,caseSize,maxRandSize,@system0)
isSystem0Linear = checkLinearity(numChecks,caseSize,maxRandSize,@system0)
isSystem0TimeInvariant = checkTimeInvariance(numChecks,caseSize,maxRandSize,@system0)

% Testing for properties in system1
isSystem1Causal = checkCausality(numChecks,caseSize,maxRandSize,@system1)
isSystem1Memoryless = checkMemoryless(numChecks,caseSize,maxRandSize,@system1)
isSystem1Linear = checkLinearity(numChecks,caseSize,maxRandSize,@system1)
isSystem1TimeInvariant = checkTimeInvariance(numChecks,caseSize,maxRandSize,@system1)

% Testing for properties in system2
isSystem2Causal = checkCausality(numChecks,caseSize,maxRandSize,@system2)
isSystem2Memoryless = checkMemoryless(numChecks,caseSize,maxRandSize,@system2)
isSystem2Linear = checkLinearity(numChecks,caseSize,maxRandSize,@system2)
isSystem2TimeInvariant = checkTimeInvariance(numChecks,caseSize,maxRandSize,@system2)

% Testing for properties in system3
isSystem3Causal = checkCausality(numChecks,caseSize,maxRandSize,@system3)
isSystem3Memoryless = checkMemoryless(numChecks,caseSize,maxRandSize,@system3)
isSystem3Linear = checkLinearity(numChecks,caseSize,maxRandSize,@system3)
isSystem3TimeInvariant = checkTimeInvariance(numChecks,caseSize,maxRandSize,@system3)

%% Functions for testing each property
function isCausal = checkCausality(numCases, caseSize, maxRandSize, system)
    for i = 1:numCases % run numCases test cases
        zeroinput = zeros(1,5); % generate a function of zeroes
        randinput = randi([-maxRandSize maxRandSize], 1, caseSize); % generate 1 random input cases
        overallinput = [zeroinput randinput]; %combine the zero function with the random generated number function
        firstTimeStep = randi([-maxRandSize maxRandSize], 1, 1); % generate a starting time step
        n = firstTimeStep:firstTimeStep+length(zeroinput)+caseSize-1; % get time steps based on randomly generated first time step

        overallresponse = round(system(n,overallinput)); %feed the input function into the system

        %compare the input and the output functions and see if there are
        %nonzero outputs at zero inputs
        if isequal(overallinput(1:length(zeroinput)),overallresponse(1:length(zeroinput))) == false
            break
        end
    end
    if i < numCases % return false if the above equation was ever false
        isCausal = false;
    else
        isCausal = true;
    end
end

function isMemoryless = checkMemoryless(numCases, caseSize, maxRandSize, system)
    for i = 1:numCases % run numCases test cases
        randinput = randi([-maxRandSize maxRandSize], 1, caseSize); % generate 1 random input cases
        firstTimeStep = randi([-maxRandSize maxRandSize], 1, 1); % generate a starting time step
        n = firstTimeStep:firstTimeStep+caseSize-1; % get time steps based on randomly generated first time step
        
        x_after = randinput; % copy the randomly generated input function
        x_after(4) = maxRandSize+10; %change a number from the input function
        y_initial = round(system(n,randinput(1,:)),5); %feed the initial input into the system
        y_after = round(system(n,x_after(1,:)),5); %feed the changed input into the system
        
        y = y_initial - y_after; %find the differences of the two outputs
        y_nonzero = y ~= 0; % find the nonzero values of the differences
        y_sum = sum(y_nonzero); % find the total number of differences

        if y_sum ~= 1 % if the total number of differences is more than 1, in other words, memoryless
            break
        end
    end
    if i < numCases % return false if the above equation was ever false
        isMemoryless = false;
    else
        isMemoryless = true;
    end
end

function isLinear = checkLinearity(numCases, caseSize, maxRandSize, system)
    for i = 1:numCases % run numCases test cases
        randCases = randi([-maxRandSize maxRandSize], 2, caseSize); % generate 2 random input cases
        scalingFactors = randi([-maxRandSize maxRandSize], 1, 2); % generate 2 random scaling factors
        firstTimeStep = randi([-maxRandSize maxRandSize], 1, 1); % generate a starting time step
        n = firstTimeStep:firstTimeStep+caseSize-1; % get time steps based on randomly generated first time step
 
        nonScaledResponses = [system(n,randCases(1,:)); system(n,randCases(2,:))]; % [y[x1[n]] ; y[x2[n]]]
        scaledSummedResponses = round(scalingFactors*nonScaledResponses, 5); % a1*y[x1[n]] + a2*y[x2[n]]

        scaledSummedCases = scalingFactors*randCases; % a1*x1[n] + a2*x2[n]
        responseToScaledSummedCases = round(system(n,scaledSummedCases), 5); % y[a1*x1[n] + a2*x2[n]]
    
        if isequal(scaledSummedResponses,responseToScaledSummedCases) == false % does a1*y[x1[n]] + a2*y[x2[n]] = y[a1*x1[n] + a2*x2[n]]?
            break;
        end
    end
    
    if i < numCases % return false if the above equation was ever false
        isLinear = false;
    else
        isLinear = true;
    end
end

function isTimeInvariant = checkTimeInvariance(numCases, caseSize, maxRandSize, system)
    for i = 1:numCases % run numCases test cases
        randCases = randi([-maxRandSize maxRandSize], 1, caseSize); % generate 1 random input case
        firstTimeStep = randi([-maxRandSize maxRandSize], 1, 1); % generate a starting time step
        n = firstTimeStep:firstTimeStep+caseSize-1; % get time steps based on randomly generated first time step
        timeShift = randi([-maxRandSize maxRandSize], 1, 1); % generate a time shift
                
        response = round(system(n,randCases),5); % y[x[n]] also y[x[n] + a]
        
        responseToShiftedInput = round(system(n+timeShift, randCases),5); % y[x[n + a]]
    
        if isequal(response,responseToShiftedInput) == false % does y[x[n] + a] = y[x[n + a]]?
            break;
        end
    end
    
    if i < numCases % return false if the above equation was ever false
        isTimeInvariant = false;
    else
        isTimeInvariant = true;
    end
end