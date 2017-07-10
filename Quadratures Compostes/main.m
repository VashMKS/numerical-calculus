%CONVERGENCIA DE LES QUADRATURES COMPOSTES
%L'objectiu d'aquest exercici es comprovar la convergencia de les
%quadratures compostes. Aquest script mostra l'evolucio de l'error en 
%funcio del nombre d'avaluacions de la funcio (cost) per a la quadratura 
%composta del trapezi. 
%
%Completa l'script per a dibuixar tambe l'evolucio de l'error per 
%a les quadratures compostes de:
% a) Simpson
% b) Gauss-Legendre amb 2 punts a cada subinterval (n=1)
% c) Gauss-Legendre amb 3 punts a cada subinterval (n=2)
%
%Observa la convergencia assimptotica. Tenen les quadratures el
%comportament esperat?
%
%Representa ara l'error per al segon exemple (paradoxa de Runge).
%Compara l'evolucio de l'error amb l'error amb quadratures simples (1 sol
%interval, augmentant n)

%% Inicialització

clear all; close all;

figure(1)
subplot(1,2,1)

% Exemple 1
f = @(x)( exp(-x)+0.5*exp(-(x-4).^2) );
a = 0; b = 5;
I = exp(-a) - exp(-b) + (1/4)*sqrt(pi)*(erf(b-4) - erf(a-4));
v = 0:0.1:5;
plot(v,f(v))
title('$f(x)=e^{-x}+\frac{1}{2} e^{-(x-4)^2}$','interpreter','latex')

% Exemple 2
% f = @(x)(1./(1+x.^2)); 
% a = -4; b = 4; 
% I = (atan(b) - atan(a));
% v = -4:0.1:4;
% plot(v,f(v))
% title('$f(x)=\frac{1}{1+x^2}$','interpreter','latex')

xlabel('x')
ylabel('f(x)')


%% Composta del Trapezi

ETrap=[];
for k=1:5
    m = 2*2^k; % nombre d'intervals (equiespaiats)
    Iaprox = CompostaTrapezi(f,a,b,m);
    ETrap = [ETrap, abs(Iaprox-I)];
end
nPuntsTrap = 2*2.^(1:5)+1;
ajustTrap = polyfit(log10(nPuntsTrap(end-2:end)),log10(ETrap(end-2:end)),1);
fprintf('\nPendent dels 3 darrers punts:\n Composta Trapezi: %0.1f\n',ajustTrap(1))

% Grafica dels errors
subplot(1,2,2)
plot(log10(nPuntsTrap),log10(ETrap),'-o')
hold on


%% Simpson

ESim = [];
for k=1:5
    m = 2^k; % nombre d'intervals (equiespaiats)
    Iaprox = CompostaSimpson(f,a,b,m);
    ESim = [ESim, abs(Iaprox-I)];
end
nPuntsSim = 2*2.^(1:5)+1;
ajustSim = polyfit(log10(nPuntsSim(end-2:end)),log10(ESim(end-2:end)),1);
fprintf('\n Composta Simpson: %0.1f \n',ajustSim(1))

% Grafica dels errors
plot(log10(nPuntsSim),log10(ESim),'-o')
hold on


%% Gauss-Legendre amb n=1 i n=2

EGL1=[]; EGL2=[];
for k=1:5
    m = 2^k; % nombre d'intervals per a GL
    Iaprox = Gauss(f,a,b,m,1);
    EGL1 = [EGL1, abs(Iaprox-I)];
    Iaprox = Gauss(f,a,b,m,2);
    EGL2 = [EGL2, abs(Iaprox-I)];
end
nPuntsGL1 = 2*2.^(1:5);
ajustGL1 = polyfit(log10(nPuntsGL1(end-2:end)),log10(EGL1(end-2:end)),1);
fprintf('\n Composta Gauss-Legendre n=1: %0.1f \n',ajustGL1(1))
nPuntsGL2 = 3*2.^(1:5);
ajustGL2 = polyfit(log10(nPuntsGL2(end-2:end)),log10(EGL2(end-2:end)),1);
fprintf('\n Composta Gauss-Legendre n=2: %0.1f \n',ajustGL2(1))

% Grafica dels errors
plot(log10(nPuntsGL1),log10(EGL1),'-o')
plot(log10(nPuntsGL2),log10(EGL2),'-o')
xlabel('log_{10}(#punts)')
ylabel('log_{10}(error)')
legend('Composta del Trapezi', 'Composta de Simpson', 'Composta de Gauss(n=1)', 'Composta de Gauss(n=2)')
hold on

