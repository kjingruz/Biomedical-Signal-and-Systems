function isMemory = checkMemory(numCases, caseSize, maxRandSize, system)
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
        isMemory = true;
    else
        isMemory = false;
    end
end