clear; clc;

% Calculamos la integral de f(x) entre 0 y 1 con el método de Montecarlo
% Asignamos 500 puntos al método y de cota elegimos M = 1
s = montecarlo(0,1,500,1);


function integral = montecarlo(a,b,N,M)
    %% Integramos la función en el intervalo [a,b]
    %% Con N puntos al azar y una cota M para f(x) 

    % Puntos debajo de la gráfica
    rojo = 0; 

    % Generamos N puntos al azar en el rectángulo [a,b]x[0,M]
    for k=1:N 
        x = a + (b-a)*rand; 
        y = M*rand;

        % Contamos el punto si cae por debajo de la gráfica
        if y <= f(x)
            rojo=rojo+1; 
        end
    end

    % Método Montecarlo para calcular la integral
    integral = (rojo/N)*M*(b-a);
end

% Función
function y = f(x)
    y = x^3;
end
