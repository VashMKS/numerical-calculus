function[x, R] = Whittaker(f, tol, maxIter, x, m)

R = zeros(1, maxIter);
newX = x - f(x)/m;
R(1) = abs((x - newX)/newX);
i = 1;

while R(i) > tol && i < maxIter
    i = i + 1;
    newX = x - f(x)/m;
    R(i) = abs((x - newX)/newX);
    x = newX;
end

% Output info
fprintf('Mètode de Whittaker\n');
fprintf('El 0 de la funció trobat és a x = %d\n', x);
fprintf('S''han dut a terme %d iteracions de Whittaker\n', i);
fprintf('\n');

% Error plotting
V = 1:1:maxIter;
plot (V, log(R), 'displayname', 'Whittaker');

end