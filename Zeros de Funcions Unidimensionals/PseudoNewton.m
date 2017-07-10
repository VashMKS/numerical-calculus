function [x, R] = PseudoNewton (f, df, tol, maxIter, x)

R = zeros(1, maxIter);
newX = x - 2*f(x)/df(x);
R(1) = abs((x - newX)/newX);
i = 1;

while R(i) > tol && i < maxIter
    i = i + 1;
    newX = x - 2*f(x)/df(x);
    R(i) = abs((x - newX)/newX);
    x = newX;
end

% Output info
fprintf('Mètode de Newton Modificat\n');
fprintf('El 0 de la funció trobat és a x = %d\n', x);
fprintf('S''han dut a terme %d iteracions d''aquest mètode ranci\n', i);
fprintf('\n');

% Error plotting
V = 1:1:maxIter;
plot (V, log(R), 'displayname', 'PseudoNewton');

end