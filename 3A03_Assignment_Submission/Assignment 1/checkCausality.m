function isCausal = checkCausality(numCases, caseSize, maxRandSize, system)
    for i = 1:numCases % run numCases test cases

        zeroinput = zeros(1,5); % generate a function of zeroes
        randinput = randi([-maxRandSize maxRandSize], 1, caseSize); % generate 1 random input cases
        overallinput = [zeroinput randinput]; %combine the zero function with the random generated number function
        firstTimeStep = randi([-maxRandSize maxRandSize], 1, 1); % generate a starting time step
        n = firstTimeStep:firstTimeStep+length(zeroinput)+caseSize-1; % get time steps based on randomly generated first time step

        nonScaledResponses = round(system(n,overallinput)); %feed the input function into the system

        %compare the input and the output functions and see if there are
        %nonzero outputs at zero inputs
        if isequal(overallinput(1:length(zeroinput)),nonScaledResponses(1:length(zeroinput))) == false
            break
        end
    end
    if i < numCases % return false if the above equation was ever false
        isCausal = false;
    else
        isCausal = true;
    end
end
