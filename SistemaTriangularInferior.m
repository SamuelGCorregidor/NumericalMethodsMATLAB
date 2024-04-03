clear; clc;

% Creamos una matriz triangular inferior
L = zeros(5);
for i=1:5
    for j=1:i
        L(i,j)=i*j;
    end
end

% Términos independientes
b = zeros(5,1);
for i=1:5
    b(i)=1;
end

% Resolvemos Lx = b
x = solveinf(L,b);

% Comprobación
L*x - b

function x = solveinf(L,b)
    %% L matriz cuadrada triangular inferior y b matriz columna
    %% x es la solución de Lx = b

    % Matrices simbólicas para calculos exactos
    L = sym(L);
    b = sym(b);
    n = length(L);

    % Iniciamos la solución en 0
    x = zeros(n,1);
    x = sym(x);
    
    % Resolvemos el sistema de arriba a abajo
    % Despejamos la primera ecuación
    x(1) = b(1) / L(1,1);
    for i = 2:n
        % Despejamos la ecuación i-ésima conociendo las anteriores
        % L(i,1:(i-1))*x(1:i-1) = L(i,1)x(1) + ... + L(i,i-1)x(i-1)
        x(i) = (b(i) - L(i,1:(i-1))*x(1:i-1))/L(i,i);
    end
end
