clear; clc;

% Puntos que vamos a interpolar
x = 0:10;
y = [1 2 1 2 1 2 1 2 1 2 1];

% Interpolación de Lagrange
L = Lagrange(x,y);

% Polinomio L(1) + L(2)x + ... + L(n)x^{n-1}
a = x(1):0.01:x(end);
b = zeros(1,length(a));
for i = 1:length(L)
    b = b + L(i)*a.^(i-1);
end

hold on
% Polinomio de Lagrange
plot(a,b,'b')

% Puntos a interpolar
plot(x,y,'*r')

function L = Lagrange(x,y)
    %% Introducir los puntos como vector fila
    % Ajustamos y a formato columna para resolver el sistema
    y=y.';

    % Definimos la matriz de Vandermonde
    V = fliplr(vander(x));

    % Obtenemos la solución de Vx = y
    L = V\y;
end
