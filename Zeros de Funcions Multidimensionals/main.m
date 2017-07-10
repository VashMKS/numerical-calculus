% Càlcul de zeros de funcions multidimensionals
clear all; close all;

NicePlot();

tol = 1e-8;
maxIter = 100;

F = @(X)(F(X));
JF = @(X)(JacobF(X));
X = [0;0;0];

NewtonRaphson(F, JF, X, tol, maxIter);
%NewtonRaphsonMod(F, X, tol, maxIter);
%NewtonRaphsonDN(F, X, tol, maxIter);
%Broyden(F, X, tol, maxIter);

legend('show');