A = 5*10; Cd = 0.65; 
f = @(t,y)(-2/(3*A)*Cd*b*sqrt(2*g)*y^(3/2));
dt = 120/4;

% TODO: all

% Euler x4
y = y0; t = 0;

y = y+dt*f(t,y); t=t+dt;
y = y+dt*f(t,y); t=t+dt;
y = y+dt*f(t,y); t=t+dt;
y = y+dt*f(t,y);

yEuler = y;

% RK4
y = y0; t = 0;

k1 = f(t,y);
k2 = f(t+h,y+h/2*k1);
k3 = f(t+h,y+h/2*k2);
k4 = f(t+h,y+k3);

yRK4 = y + h/6*(k1+2*k2+2*k3+k4);


% Errors
sol = 0.383;
EEuler = abs(yEuler-sol);
ERK4 = abs(yRK4-sol);
figure(1)
xlabel('log(#eval)','interpreter','latex')
ylabel('log(E)','interpreter','latex')
hold on