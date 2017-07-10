function [] = NewtonRaphsonDN (F, X, tol, maxIter)

J = NumJF(F, X);
deltaX = -J\F(X); % Contrabarra per a resoldre el sistema
newX = X + deltaX;
R = norm((X - newX))/norm(newX);
i = 1;

while (R(i) > tol || R(i)*norm(newX) > tol) && i < maxIter
    i = i + 1;
    J = NumJF(F, X);
    deltaX = -J\F(X);
    newX = X + deltaX;
    R = [R norm((X - newX))/norm(newX)];
    X = newX;
end

% Output info
fprintf('M�tode de Newton-Raphson amb Derivaci� Num�rica\n');
fprintf('El 0 de la funci� trobat �s a:');
display(X);
fprintf('S''han dut a terme %d iteracions\n', i);
fprintf('\n');

% Graphing of the error
plot (log(R), 'displayname', 'Newton-Raphson amb Derivaci� Num�rica');
end