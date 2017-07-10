function [] = NewtonRaphson (F, JF, X, tol, maxIter)

J = JF(X);
deltaX = -J\F(X); % Contrabarra per a resoldre el sistema
newX = X + deltaX;
R = norm((X - newX))/norm(newX);
i = 1;

while (R(i) > tol || R(i)*norm(newX) > tol) && i < maxIter
    i = i + 1;
    J = JF(X);
    deltaX = -J\F(X);
    newX = X + deltaX;
    R = [R norm((X - newX))/norm(newX)];
    X = newX;
end

% Output info
fprintf('Mètode de Newton-Raphson\n');
fprintf('El 0 de la funció trobat és a:');
display(X);
fprintf('S''han dut a terme %d iteracions\n', i);
fprintf('\n');

% Graphing of the error
plot (log(R), 'displayname', 'Newton-Raphson');

end