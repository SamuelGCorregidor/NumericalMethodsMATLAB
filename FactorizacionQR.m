% MATLAB incluye la función qr(A)
clear; clc;

% Matriz que vamos a factorizar
V = [1 1 1; 1 -1 0; 1 0 -1];

% Aplicamos factorizacion QR
[Q,R] = qr_fact(V)

% Comprobamos
Q*R - V

function [Q,R] = qr_fact(A)
    %% Aplicamos el método de Gram Schmidt para obtener
    %% Q ortogonal y R triangular superior, A = QR
    A = sym(A);
    [n,k] = size(A);
    Q = zeros(n,k);
    Q = sym(Q);
    R = Q;
    Q(:,1) = A(:,1) / norm(A(:,1));
    for i=2:k
        Q(:,i) = A(:,i);
        for j = 1:(i-1)
            Q(:,i) = Q(:,i) - ( Q(:,j)' * Q(:,i) ) * Q(:,j);
        end
        Q(:,i) = Q(:,i) / norm(Q(:,i));
    end 
    for i=1:k
        for j = i : n
            R(i,j) = Q(:,i)' * A(:,j);
        end
    end
end
