% Objectius:
% - Entendre els conceptes basics dels metodes per a la resolucio numerica
% d'EDOs.
% - Implementar un metode per resoldre EDOs (metode d'Euler)
% - Comprovar experimentalment la convergencia d'un metode
%
% Tasques a fer:
% 1) Executar i mirar aquest script per veure com es pot resoldre el 
%    problema de valor inicial (PVI) amb la funcio de Matlab ode45
% 2) Implementar el metode d'Euler per a la resolucio del mateix PVI
%    Cal crear la funcio Euler amb els arguments d'entrada i sortida
%    especificats a aquest script. 
% 3) Dibuixar una grafica de log10(abs(error)) en funcio de log10(h), on l'error
%    s'evalua com la diferencia entre la solucio analitica i la solucio
%    numerica per x=2. Comprovar si l'ordre de convergencia coincideix amb
%    el teoric.
% Es proposa ara resoldre el PVI y''= -y, y(0)=1, y'(0)=0 per x en (0,T)
% 4) Reduir la EDO de segon ordre a un sistema d'EDOs de 1er ordre
%    Resoldre numericament el PVI amb el metode d'Euler per T=2*pi. Comprovar
%    la convergencia.
% 5) Amb h=0.01 resoldre el problema per T=10*pi,50*pi. Es el metode
%    (absolutament) estable? 

%% Inicialització
% EDO dy/dx = -y/(10x+1) per x en (0,1)
% amb condicio inicial y(0)=1
% la solucio analitica es y(x) = (-1/(-10x-1))^(1/10)
f=@(x,y)(-y/(10*x+1)); a=0; b=2; y0=1;

%% 1) Solució amb funcions intrínseques de Matlab
[x,Y]=ode45(f,[a,b],y0);
figure(1), plot(x,Y,'-*'), title('ode45');

%% 2) Solució amb el mètode d'Euler
h = 0.1;
nPassos = ceil((b-a)/h); 
[x,Y] = Euler(f,[a,b],y0,nPassos);
figure(2), plot(x,Y,'-*'), title('Euler');

%% 3) Obervació de l'ordre de convergencia per a diferents valors d'h
% Solucio analítica per a x=2
y = 0.73752724891;
E = zeros(100,1); h = zeros(100,1); nPassos = zeros(100,1);
for i=1:100
    h(i) = (b-a)/(10*i);
    nPassos(i) = ceil((b-a)/h(i));
    [x,Y] = Euler(f,[a,b],y0,nPassos(i));
    % figure(4), plot(x,Y,'-*'), hold on;
    E(i) = abs(Y(nPassos(i))-y);
end
figure(3), plot(log10(nPassos),log10(E)), title('Convergència del mètode d''Euler');

%% 4) EDO de segon ordre y''= -y, y(0)=1, y'(0)=0 per x en (0,T)
% Cal transformarla en un sistema de dues d'EDOs de primer ordre
% y1 = y, y2 = dy/dx, Y = [y1 y2]
% f(x,Y) = [y2 -y], alpha = [1 0] = Y(0)
% tenim doncs dy1/dx = y2 i dy2/dx = -y
T = 2*pi;
f = @(x,y)([0 1; -1 0]*y); a = 0; b = T;
y0 = [1;0];

h = 0.1;
nPassos = ceil((b-a)/h); 
[x,Y] = Euler(f,[a,b],y0,nPassos);
figure(5), plot(x,Y,'-*'), title('Euler');

%% 5) Estabilitat absoluta?
T = 50*pi;
f = @(x,y)([0 1; -1 0]*y); a = 0; b = T;
y0 = [1;0];

h = 0.01;
nPassos = ceil((b-a)/h); 
[x,Y] = Euler(f,[a,b],y0,nPassos);
figure(5), plot(x,Y), title('Euler');
% el mètode no és estable, la solució analítica és un cosinus mentre que la
% nostra solució clarament no ho és. Això és degut a que ens trobem fora de
% la regió de convergència
