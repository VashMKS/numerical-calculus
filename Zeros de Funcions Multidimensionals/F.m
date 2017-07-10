function f = F(x)

% Usant la primera equació veiem que x1\in [-1/6, 1/2]
% Usant la segona veiem que x2\in [-0.26888, -0.12722]
% Usant la tercera veiem que x3\in [-0.5259, -0.5173]

f = [6*x(1)-2*cos(x(2)*x(3))-1
     9*x(2)+sqrt(x(1)*x(1)+sin(x(3))+1.06)+0.9
     60*x(3)+3*exp(x(1)*x(2))+10*pi-3
    ];

end