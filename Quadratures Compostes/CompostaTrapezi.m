function Iaprox = CompostaTrapezi(f,a,b,m)

x = linspace(a,b,m+1); h=(b-a)/m;
Iaprox = f(x(1))*h/2 + sum(f(x(2:end-1)))*h + f(x(end))*h/2;

end