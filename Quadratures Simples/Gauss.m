function [Iaprox,rel] = Gauss(F,n,a,b)

% Transformació de l'interval per a integrar de -1 a 1
G = @(x)(F((b-a)/2*x+(a+b)/2));

% Punts de Gauss
[X,w] = QuadraturaGauss(n+1);

% I = (b-a)/2*integral(G,-1,1); (equivalentment)
I = integral(F,a,b);

% Valor de la integral aproximada tenint en compte la transformació
Iaprox = (b-a)/2*w*G(X);
rel = abs((I-Iaprox)/I);

end