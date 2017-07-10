function Iaprox = Gauss(f,a,b,m,n)

% Punts de Gauss
[z,w] = QuadraturaGauss(n+1);

h = (b-a)/m;
A = a; B = A+h;

Iaprox = 0;
for i=1:m
    % Transformació de l'interval per a integrar de -1 a 1
    G = @(x)(f((B-A)/2*x+(A+B)/2));
    
    Iaprox = Iaprox + (B-A)/2*w*G(z);
    
    A = B;
    B = A+h;
end

end