clear; clc;

% Matriz que vamos a factorizar
A = [2 -1 0 0 0; -1 2 -1 0 0; 0 -1 2 -1 0; 0 0 -1 2 -1; 0 0 0 -1 2];

% Factorización de cholesky A = U*U'
U = cholesky(A);

% Comprobamos que la factorización es correcta:
U * U' - A

function U = cholesky(A)
    %% A matriz hermítica y definida positiva
    %% U matriz triangular inferior con diagonal positiva
    
    % Convertimos en matriz simbólica para resultados exactos
    A = sym(A);

    % Calculamos el orden de A
    n = length(A);

    % Creamos la matriz que vamos a formar
    U = zeros(n);
    U = sym(U);

    % Iniciamos algoritmo
    U(1,1) = sqrt(A(1,1));
    for i = 2:n
        for j = 1:(i-1)
            suma = 0;
            for s = 1:(j-1)
                suma = suma + U(i,s)*U(j,s);
            end
            U(i,j)=(A(i,j) - suma)/U(j,j);
        end
        suma = 0;
        for k = 1:(i-1)
            suma = suma + U(i,k)^2;
        end
        U(i,i) = sqrt(A(i,i) - suma);
    end
end
