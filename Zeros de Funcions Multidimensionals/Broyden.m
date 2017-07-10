function [X, R] = Broyden (F, X, tol, maxIter)

S = JacobF(X);
deltaX = -S\F(X); % Contrabarra per a resoldre el sistema
newX = X + deltaX;
R = norm((X - newX)/newX);
X = newX;
i = 1;

while (R(i) > tol || R(i)*norm(newX) > tol) && i < maxIter
    i = i + 1;
    v = deltaX;
    u = F(X)/norm(deltaX)^2;
    S = S+u*v'; % modificaci� de rang 1
    deltaX = -S\F(X);
    newX = X + deltaX;
    R = [R norm((X - newX)/newX)];
    X = newX;
end

% Output info
fprintf('M�tode de Broyden\n');
fprintf('El 0 de la funci� trobat �s a:');
display(X);
fprintf('S''han dut a terme %d iteracions\n', i);
fprintf('\n');

% Graphing of the error
plot (log(R), 'displayname', 'Broyden');

end