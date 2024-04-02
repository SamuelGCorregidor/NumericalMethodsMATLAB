clear; clc;

% Vamos a resolver f(x)=0 para x en [0.4,0.5] con un error máximo de 0.00001
r = biseccion(0.4,0.5,0.00001);

function r = biseccion(a,b,error)
    % Comprobamos las hipótesis del Teorema de Bolzano
    if f(a) * f(b) > 0
        disp('No se cumplen las hipótesis del Teorema de Bolzano.')
    end

    % Primera bisección del intervalo
    r = (a+b)/2;

    % Aplicamos el algoritmo en bucle hasta obtener un error por debajo del indicado
    while abs(f(r)) > error 
        if f(a) * f(r) > 0
            % En este caso el intervalo que contiene la raiz es el [r,b]
            a = r;
        else
            % En este caso el intervalo que contiene la raiz es el [a,r]
            b = r;
        end

        % Nueva bisección
        r = (a+b)/2;
    end
end

% Función
function y = f(x)
    y = sqrt(x)*sin(1/x)-x;
end
