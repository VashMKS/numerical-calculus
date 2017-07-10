% Interpolació polinòmica per mínims quadrats
clear;

F = @(x)(f(x));
v = -1:0.01:1; fv = F(v);

%% Interpolació Pura
figure(1)
subplot(2,2,1);
plot(v,fv,'LineWidth',2);
title('Interpolació Polinòmica')
hold on;
n = [3,5,7,9];
for i=1:length(n)
    N = n(i);
    x = linspace(-1,1,N); y = F(x);
    coef = polyfit(x,y,N-1);
    eval = polyval(coef,v);
    subplot(2,2,1);
    plot(v,eval);
    hold on;
end
legend('f','grau 3','grau 5','grau 7','grau 9');

%% Mínims Quadrats amb 101 punts equiespaiats
N = 101;
x = linspace(-1,1,N); y = F(x);
subplot(2,2,2);
plot(v,fv,'LineWidth',2);
title('Mínims Quadrats amb 101 punts equiespaiats')
hold on;
m = [2,4,6,8];
for i=1:length(m)
    coef = polyfit(x,y,m(i));
    eval = polyval(coef,v);
    
%     % Error Quadràtic
%     EQ = (y-polyval(coef,x)).^2;
%     % Display de l'error
%     fprintf('Error quadràtic per al polinomi de grau %d\n', m(i));
%     display(EQ);
%     
%     % Residu de l'aproximació
%     R = F(v)-polyval(coef,v);
%     figure(2)
%     plot(v,R);
%     hold on;
%     figure(1)
    
    subplot(2,2,2);
    plot(v,eval);
    hold on;
end
legend('f','grau 2','grau 4','grau 6','grau 8');

%% Mínims Quadrats amb polinomis de Legendre
N = 101;
x = linspace(-1,1,N); y = F(x);
subplot(2,2,3);
plot(v,fv,'LineWidth',2);
title('Mínims Quadrats amb polinomis de Legendre')
hold on;
m = [2,4,6,8];
for i=1:length(m)
    P = @(x)(0);
    for j=0:m(i)
        L = @(x)(legendreP(j,x));
        c = integral(@(x)(L(x).*F(x)),-1,1)/integral(@(x)(L(x).*L(x)),-1,1);
        P = @(x)(P(x)+c*L(x));
    end
    eval = P(v);
    
%     % Error Quadràtic
%     EQ = (y-P(x)).^2;
%     fprintf('Error quadràtic per al polinomi de grau %d\n', m(i));
%     display(EQ);
%     
%     % Residu de l'aproximació
%     R = F(v)-P(v);
%     figure(3)
%     plot(v,R);
%     title('Residu per als polinomis de Legendre');
%     hold on;
%     figure(1)
    
    subplot(2,2,3);
    plot(v,eval);
    hold on;
end
legend('f','grau 2','grau 4','grau 6','grau 8');

%% Mínims Quadrats amb polinomis de Chebyshev
N = 101;
x = linspace(-1,1,N); y = F(x);
subplot(2,2,4);
plot(v,fv,'LineWidth',2);
title('Mínims Quadrats amb polinomis de Chebyshev')
hold on;
m = [2,4,6,8];
for i=1:length(m)
    P = @(x)(0);
    for j=0:m(i)
        L = @(x)(chebyshevT(j,x));
        c = integral(@(x)(L(x).*F(x)./(sqrt(1-x.^2))),-1,1)/integral(@(x)(L(x).*L(x)./(sqrt(1-x.^2))),-1,1);
        P = @(x)(P(x)+c*L(x));
    end
    eval = P(v);
    
%     % Error Quadràtic
%     EQ = (y-P(x)).^2;
%     fprintf('Error quadràtic per al polinomi de grau %d\n', m(i));
%     display(EQ);
%     
%     % Residu de l'aproximació
%     R = F(v)-P(v);
%     figure(2)
%     plot(v,R);
%     title('Residu per als polinomis de Chebyshev');
%     hold on;
%     figure(1)
    
    subplot(2,2,4);
    plot(v,eval);
    hold on;
end
legend('f','grau 2','grau 4','grau 6','grau 8');

legend('show');