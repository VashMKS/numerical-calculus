function [xS3,yS3,coeficients] = dibuixaSplineParabolicC1(x,y)

xS3 = []; yS3 = []; coeficients = [];
x01 = 0:1/20:1; % 20 subintervals a cada interval

h = x(2:end)-x(1:end-1);
dS = (y(2)-y(1))/h(1);

for i=1:length(x)-1
    M = [x(i)^2,x(i),1; 2*x(i), 1, 0; x(i+1)^2, x(i+1), 1];
    B = [y(i); dS; y(i+1)];
    coef = M\B;
    a = coef(1); b = coef(2); c = coef(3);
    dS = 2*a*x(i+1)+b;
    xs = x(i)+x01*h(i);
    ys = a*(xs.^2) + b*xs + c;
    xS3 = [xS3 xs]; yS3 = [yS3 ys]; coeficients = [coeficients; coef'];
end

end