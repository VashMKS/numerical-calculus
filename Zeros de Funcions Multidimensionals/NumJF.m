function [J] = NumJF(F, x)

n = length(x);
J = zeros(n, n);
e = eye(n);
h = 1e-8; % valor escollit per prova i error, fa que la convergència sigui quadràtica

for j=1:n
    J(:, j) = (F(x + h*e(:,j))-F(x))/h;
end

end