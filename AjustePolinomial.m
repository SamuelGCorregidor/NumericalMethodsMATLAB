clear; clc;

% Puntos que vamos a ajustar
x = 0:10;
y = [1 2 1 2 1 2 1 2 1 2 1];

% Ajuste mediante polinomio de grado k=8
L = Lagrange(x,y,8);

% Polinomio L(1) + L(2)x + ... + L(n)x^{n-1}
a = x(1):0.01:x(end);
b = zeros(1,length(a));
for i = 1:length(L)
    b = b + L(i)*a.^(i-1);
end

hold on
% Polinomio de ajuste
plot(a,b,'b')

% Puntos a ajustar
plot(x,y,'*r')

function L = Lagrange(x,y,k)
    %% Introducir los puntos como vector fila
    % Ajustamos y a formato columna para resolver el sistema
    y=y.';

    % Definimos la matriz de Vandermonde truncada
    n = length(x);
    V = zeros(n,k+1);
    V(:,1) = ones(n,1);
    for i = 1:k
        V(:,i+1) = x.^i;
    end

    % Obtenemos la solución mínimo-cuadrática de Vx = y
    L = V\y;
end
