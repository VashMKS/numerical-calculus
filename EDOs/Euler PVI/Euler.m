function [x,y] = Euler(f,tspan,y0,nStep)

a = tspan(1); b = tspan(2); h = (b-a)/nStep;
x = linspace(a,b,nStep);
y = y0;

for i=1:nStep-1
    y = [y y(:,i) + h*f(x(i),y(:,i))];
end

end