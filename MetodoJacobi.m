clear; clc;

% Matriz de coeficientes
A = pascal(2); 

% Términos independientes
b = [11; 13]; 

% Aproximación inicial de la solución
x0 = [1; 1]; 

% Error
e = 0.00009; 

% Método de Jacobi para Ax = b
x = jacobi(A,b,x0,e)

function x = jacobi(A,b,x,error)
    %% A matriz cuadrada y b matriz columna. x0 aproximación inicial de Ax = b
    %% error es el máximo error permitido (En mínimos-cuadrados)
    
    % Dimensión del vector
    n = length(x);
    y = x;

    % Iniciamos el punto fijo 
    while norm(A*x - b) > error
        for i = 1:n
            x(i) = (b(i) - A(i,1:i-1) * y(1:i-1) - A(i,i+1:n) * y(i+1:n)) / A(i,i);
        end
        y = x;
    end
end
