function [x2, R] = bisect (f, tol, maxIter, x1, x2)

R = zeros (1, maxIter);
newX = (x1 + x2)/2;
i = 1;
if f(newX)*f(x2) > 0
    R(i) = abs((x2 - newX)/newX);
    x2 = newX;
elseif f(newX)*f(x2) < 0
    R(i) = abs((x2 - newX)/newX);
    x1 = x2;
    x2 = newX;
else 
    R(i) = 0;
end


while R(i) > tol && i < maxIter
   i = i + 1;
   newX = (x1 + x2)/2;
   if f(newX)*f(x2) > 0
       R(i) = abs((x2 - newX)/newX);
       x2 = newX;
   elseif f(newX)*f(x2) < 0
       R(i) = abs((x2 - newX)/newX);
       x1 = x2;
       x2 = newX;
   else
       R(i) = 0;
   end
end

% Output info
fprintf('Mètode de la Bisecció\n');
fprintf('El 0 de la funció trobat és a x = %d \n', x2);
fprintf('\n');

% Error plotting
V = 1:1:maxIter;
plot (V, log(R), 'displayname', 'bisecció');

end