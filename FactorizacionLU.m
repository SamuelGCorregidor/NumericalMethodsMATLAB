% MATLAB incluye la función lu(A) para calcular esta factorización
clear; clc;

% Matriz que vamos a factorizar
A= [ -2 1 0 0 0 0; 1 -2 1 0 0 0; 0 1 -2 1 0 0; 0 0 1 -2 1 0; 0 0 0 1 -2 1 ; 0 0 0 0 1 -2 ];

% Factorización LU
[L,U] = LU(A);

% Comprobamos la factorizacion
L*U - A

function [L, U] = LU(A)
    %% Factorización LU de Crout 
    %% L matriz triangular inferior (Doolittle si la diafonal está compuesta de 1s)
    %% U matriz triangular superior, con la diagonal compuesta de 1s (Crout)

    % Convertimos en simbólica la matriz
    A = sym(A);
    
    % Calculamos el orden de A
    n = length(A);

    % Formamos matrices con unos en la diagonal
    L = eye(n); 
    L = sym(L);
    U = L;

    % Algoritmo de la factorización de Crout
    for i = 1:n
        L(i, 1) = A(i, 1);
    end
    for j = 2:n
        U(1, j) = A(1, j) / L(1, 1);
    end
    for i = 2:n
        for j = 2:i
            L(i, j) = A(i, j) - L(i, 1:j - 1) * U(1:j - 1, j);
        end
        
        for j = i + 1:n
            U(i, j) = (A(i, j) - L(i, 1:i - 1) * U(1:i - 1, j)) / L(i, i);
        end
    end
end
