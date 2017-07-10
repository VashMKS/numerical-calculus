function d2S = calculaCurvaturesSplineNatural(x,y)

n = length(x)-1;

i = 1:n;
h(i)=(x(i+1)-x(i));
t(i)=(y(i+1)-y(i));

% termes independents
i = 1:n-1;
d(i)=(6./(h(i+1)+h(i))).*(t(i+1)./h(i+1)-t(i)./h(i));
d = d';

% coeficients de la matriu del sistema
i = 1:n-2;
mu(i) = h(i)./(h(i+1)+h(i));
lambda(i) = h(i+1)./(h(i+1)+h(i));
mu = mu';
lambda = lambda';
dprin = (ones(1,n-1))';

D = 2*diag(dprin)+diag(lambda,1)+diag(mu,-1);
% Alternativament usant spdiags: DOESN'T WORK, SILLY BUG
% dsup = [0;lambda(1:n-2)];
% dinf = [mu(1:n-2);0];
% D = spdiags([dinf,dprin,dsup],[-1,0,1],n-1,n-1);

% Solució del sistema
d2S = D\d;
d2S = [0;d2S;0]; 

end