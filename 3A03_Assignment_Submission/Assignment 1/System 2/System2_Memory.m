% Code from Kevin Zhang (400319666) for Memory

%Test case 1

%sets up the discrete steps (n) and the inputs (x)
n1 = -5:5;
x1 = [0,0,3,4,2,1,-2,-5,-4,-1,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n1,x1)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y1 = system2(n1,x1);

%Plots the output values
figure
stem(n1,y1)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%%

%test case 2

%In this test case, we change the fourth number

%sets up the discrete steps (n) and the inputs (x)
n2 = -5:5;
x2 = [0,0,3,-2,2,1,-2,-5,-4,-1,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n2,x2)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y2 = system2(n2,x2);

%Plots the output values
figure
stem(n2,y2)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

%%

%test case 3

%In this second test case, we change the second last number

%sets up the discrete steps (n) and the inputs (x)
n3 = -5:5;
x3 = [0,0,3,-2,2,1,-2,-5,-4,5,0];

%creates the plot from the input and the discrete steps. also sets up the x
%and y axis titles
figure
stem(n3,x3)
title('Input x[n]')
xlabel('index n')
ylabel('x[n]')

%inputs the inputs(x) into the system and assign it to output(y)
y3 = system2(n3,x3);

%Plots the output values
figure
stem(n3,y3)
title('Output y[n]')
xlabel('index n')
ylabel('y[n]')

