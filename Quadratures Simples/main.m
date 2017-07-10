% Càlcul de quadratures per a la integració numèrica de funcions
%% Inicialització
clear;

F = @(x)(exp(-x)+0.5.*exp(-(x-4).^2));
a = 0; b = 5;
v = a:0.01:b; fv = F(v);
figure(1)
subplot(1,2,1);
plot(v,fv,'LineWidth',2);
xlabel('$x$','interpreter','Latex');
ylabel('$f(x)$','interpreter','Latex');
grid on;
legend('f')
title('$f(x)=e^{-x} +0.5e^{-(x-4)^2}$','interpreter','Latex')
hold on;

%% Quadratura Newton-Cotes (tancada) amb punts equiespaiats
N = 1:14;
RNCT = [];
for i=1:length(N)
    X = linspace(a,b,N(i)+1);
    [Iaprox,rel] = NewtonCotes(F,X,a,b);
    RNCT = [RNCT rel];
end
subplot(1,2,2);
plot(log(N),log(RNCT));
title('Error de la quadratura','interpreter','Latex')
hold on;

%% Quadratura de Newton-Cotes (oberta) amb punts equiespaiats
N = 3:14;
RNCO = [];
for i=1:length(N)
    X = linspace(a,b,N(i)+1);
    [Iaprox,rel] = NewtonCotes(F,X(2:N(i)),a,b);
    RNCO = [RNCO rel];
end
subplot(1,2,2);
plot(log(N),log(RNCO));
hold on;

%% Quadratura de Gauss
N = 0:14;
RGauss = [];
for i=1:length(N)
    [Iaprox,rel] = Gauss(F,N(i),a,b);
    RGauss = [RGauss rel];
end
subplot(1,2,2);
plot(log(N),log(RGauss));
xlabel('$log(n)$','interpreter','Latex');
ylabel('$log(r)$','interpreter','Latex');
legend('N-C Tancada','N-C Oberta','Gauss');
grid on;
hold on;

legend('show');