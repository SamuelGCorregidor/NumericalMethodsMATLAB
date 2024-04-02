clear; clc;

% Vamos a resolver g(x)=x con el método del Punto Fijo iniciando en x=-1.5 con un error máximo de 0.0001
r = fijo(-1.5,0.0001);

function x = fijo(x,error)
    % Aplicamos el algoritmo en bucle hasta obtener un error por debajo del indicado
    while abs(f(x)-x) > error
        % Fórmula iterativa del punto fijo
        x = g(x);
    end
end

% Función
function y = g(x)
    y = 1/x + x/2;
end
