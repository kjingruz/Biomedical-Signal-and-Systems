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