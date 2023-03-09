function [posScaledInpFun, negScaledInpFun, resp, posScaledResp, negScaledResp, respToPosScaledInpFun, respToNegScaledInpFun] = plotScaling(posScalingFactor, negScalingFactor, inpFun, n, system, inpFunName, systemNum, plotFun)
    % Scaled input functions: a*x[n]
    posScaledInpFun = posScalingFactor * inpFun;
    negScaledInpFun = negScalingFactor * inpFun;
    
    % Response to original input function: y[x[n]]
    resp = system(n,inpFun);
    
    % Scaled response of original function a*y[x[n]]
    posScaledResp = posScalingFactor * resp;
    negScaledResp = negScalingFactor * resp;
    
    % Response to scaled input function: y[a*x[n]]
    respToPosScaledInpFun = system(n,posScaledInpFun);
    respToNegScaledInpFun = system(n,negScaledInpFun);

    % graphing input function and its response
    BasicInputFunction = figure;
    tiledlayout(2,1);

    nexttile
    plotFun(n,inpFun);
    title("Input: " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("x[n]")
    grid("on")

    nexttile
    plotFun(n,resp);
    title("Output: " + inpFunName + " Response")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[x[n]]")
    grid("on")

    % graphing positively scaled input function, actual output, and expected output
    PositiveScaledInputFunction = figure;
    tiledlayout(3,1);

    nexttile
    plotFun(n,posScaledInpFun);
    title("Input: Positive Scaled " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("a*x[n]")
    grid("on")

    nexttile
    plotFun(n,respToPosScaledInpFun);
    title("Actual Output: Response to Positive Scaled " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[a*x[n]]")
    grid("on")

    nexttile
    plotFun(n,posScaledResp);
    title("Expected Output: Positive Scaled " + inpFunName + " Response")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("a*y[x[n]]")
    grid("on")

    % graphing negatively scaled impulse function, actual output, and expected output
    NegativeScaledInputFunction = figure;
    tiledlayout(3,1);

    nexttile
    plotFun(n,negScaledInpFun);
    title("Input: Negative Scaled " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("-a*x[n]")
    grid("on")

    nexttile
    plotFun(n,respToNegScaledInpFun);
    title("Actual Output: Response to Negative Scaled " + inpFunName)
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("y[-a*x[n]]")
    grid("on")
    
    nexttile
    plotFun(n,negScaledResp);
    title("Expected Output: Negative Scaled " + inpFunName + " Response")
    subtitle("System" + int2str(systemNum))
    xlabel("n")
    ylabel("-a*y[x[n]]")
    grid("on")
end