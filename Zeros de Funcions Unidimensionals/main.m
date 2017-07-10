clear;
close all;
NicePlot();

f = @(x)(pol(x));
df = @(x)(dpol(x));
x1 = -1000;
x2 = 1;
tol = 1e-8;
maxIter = 50;

%bisect(f, tol, maxIter, x1, x2);
%secant(f, tol, maxIter, x1, x2);
Newton(f, df, tol, maxIter, x1);
%Whittaker(f, tol, maxIter, x1, df(x1));
%PseudoNewton(f, df, tol, maxIter, x1);

legend('show');