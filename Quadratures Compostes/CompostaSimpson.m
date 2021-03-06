function Iaprox = CompostaSimpson (f,a,b,m)

x = linspace(a,b,2*m+1); h=(b-a)/(2*m);

Iaprox = 0;
for i=1:m
    Iaprox = Iaprox + f(x(2*i-1)) + 4*f(x(2*i)) + f(x(2*i+1));
end
Iaprox = h/3*Iaprox;

end