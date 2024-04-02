clear; clc;

% Vamos a resolver f(x)=0 para x en [1,2] con un error máximo de 0.000001
r = secante(1,2,0.000001);

function r = secante(a,b,error)
    % Comprobamos las hipótesis del Teorema de Bolzano
    if f(a) * f(b) > 0
        disp('No se cumplen las hipótesis del Teorema de Bolzano.')
    end

    % Primera iteración de la secante
    r = b - f(b) * (b-a) / ( f(b) - f(a) );

    % Aplicamos el algoritmo en bucle hasta obtener un error por debajo del indicado
    while abs(f(r)) > error
        % Establecemos el nuevo intervalo en el que aplicar la secante
        a = b;
        b = r;

        % Aplicamos la fórmula para la nueva iteración
        r = b - f(b) * (b-a) / ( f(b) - f(a) );
    end
end

% Función
function y = f(x)
    y = x*e^x - e^x + 1;
end
