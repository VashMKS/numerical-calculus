function [x2, R] = secant (f, tol, maxIter, x1, x2)

R = zeros(maxIter, 1);
newX = x2 - f(x2)*(x2-x1)/(f(x2)-f(x1));
R(1) = abs((newX - x2)/newX);
i = 1;

while R(i) > tol && i < maxIter
    i = i + 1;
    newX = x2 - f(x2)*(x2-x1)/(f(x2)-f(x1));
    R(i) = abs((newX - x2)/newX);
    x1 = x2;
    x2 = newX;
end

% Output info
fprintf('Mètode de la Secant\n');
fprintf('El 0 de la funció trobat és a x = %d \n', x2);
fprintf('\n');

% Error plotting
V = 1:1:maxIter;
plot(V, log(R), 'displayname', 'Secant');

end