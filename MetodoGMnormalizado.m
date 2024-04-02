clear; clc;

% Consideramos una matriz de vectores colocados por columnas
V = [1 1 1; 1 -1 0; 1 0 -1]
% Aplicamos la función para obtener otra matriz, cuyas columnas serán los vectores obtenidos de GM
U = gm_ortonormal(V)

function Q = gm_ortonormal(A)
    %% Las columnas de la matriz A representan los vectores sobre los que aplicar Gram Smidt normalizado, 
    %% y la salida devuelve una matriz cuyas columnas están formadas por los vectores resultado del método.
    %% Se asume que el producto escalar es el usual.

    % Hacemos simbólica la matriz para obtener resultados exactos, en la práctica puede eliminarse.
    A = sym(A); 

    % Obtenemos el tamaño de la matriz (k = número de vectores, n = dimensión del espacio)
    [n,k] = size(A);

    % Declaramos la matriz Q que vamos a construir, inicialmente llena de ceros
    Q = zeros(n,k);

    % Hacemos simbólica la matriz para obtener resultados exactos, en la práctica puede eliminarse.
    Q = sym(Q);

    % Empezamos normalizando el primer vector
    Q(:,1) = A(:,1) / norm(A(:,1)); 

    % BUCLE
    for i=2:k
        % Declaramos el vector i-ésimo como el de partida
        Q(:,i) = A(:,i);

        % Restamos el sumatorio de la fórmula recursiva del método de Gram Schmidt
        for j = 1:(i-1)
            Q(:,i) = Q(:,i) - ( Q(:,j).' * Q(:,i) ) * Q(:,j); 
        end

        % Normalizamos el vector obtenido
        Q(:,i) = Q(:,i) / norm(Q(:,i));
    end
end
