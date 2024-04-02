clear;
clc;

% Definimos por columnas el vector que queremos proyectar
x = [1; 1; 1; 1];

% Definimos por columnas los vectores que generan el subespacio sobre el que proyectamos
u = [1; 0; 1; 0];
v = [2; 1; 0; 4];
w = [0; 2; 2; 1];

% Juntamos por columnas los vectores en una matriz
A = [u v w];

% Calculamos la proyeccion de x sobre colspace(A)
xproy = proyeccion(x,A)

% FUNCIÓN PARA CALCULAR LA PROYECCIÓN
function xproy = proyeccion(x,A)
    %% x es un vector por columnas y A es una matriz cuyas columnas representan vectores LINEALMENTE INDEPENDIENTES.
    %% La función calcula la proyección de x sobre colspace(A)

    % Para obtener resultados exactos convertimos en vectores simbólicos
    x = sym(x);

    % Calculamos una base ortonormal con GM
    A = gm_ortonormal(A);

    % Calculamos el número de vectores 
    [~,k] = size(A);

    % Calculamos la proyección mediante los coeficientes de Fourier
    xproy = (x.' * A(:,1)) * A(:,1);
    for i = 2:k
        xproy = xproy + (x.' * A(:,k)) * A(:,k);
    end
end

% Función para aplicar Gram Schmidt (revisar Metodo GMnormalizado)
function Q = gm_ortonormal(A)
    A = sym(A);
    [n,k] = size(A);
    Q = zeros(n,k);
    Q = sym(Q);
    Q(:,1) = A(:,1) / norm(A(:,1)); 
    for i=2:k
        Q(:,i) = A(:,i);
        for j = 1:(i-1)
            Q(:,i) = Q(:,i) - ( Q(:,j).' * Q(:,i) ) * Q(:,j); 
        end
        Q(:,i) = Q(:,i) / norm(Q(:,i)); 
    end
end
