function [Iaprox,Erel,Eabs] = NewtonCotes(F,X,a,b)

I = integral(F,a,b);
n = length(X)-1;


% Imposem que la quadratura sigui exacta per a polinomis de grau <= n
A = ones(n+1,n+1);
int = zeros(1,n+1);
int(1) = b-a;
for i=1:n
    int(i+1) = (b^(i+1)-a^(i+1))/(i+1);
    A(i+1,:) = (X.^i)';
end
w = A\int';

Iaprox = F(X)*w;
Eabs = abs(Iaprox-I);
Erel = abs(Eabs/I);

% Opció: Interpolar F per in polinomi i integrar
% Per exemple, amb la interpolació de Lagrange els coeficients de la
% quadratura quedarien w(i) = integral(Li,a,b) on Li és el polinomi de
% lagrange a x(i)

end