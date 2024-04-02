clear; clc;

% Vamos a resolver f(x)=0 con el método de Newton iniciando en x=3 con un error máximo de 0.0001
r = newton(3,0.0001);

function x = newton(x,error)
    % Aplicamos el algoritmo en bucle hasta obtener un error por debajo del indicado
    while abs(f(x)) > error
        % Fórmula iterativa de Newton
        x = x - f(x) / df(x);
    end
end

% Función
function y = f(x)
    y = sin(x);
end

% Derivada 
function y = df(x)
    y = cos(x);
end
