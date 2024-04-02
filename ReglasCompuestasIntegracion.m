clear; clc;

% Integración de f(x) con la regla del trapecio compuesta entre 0 y 1 tomando 2 subintervalos (3 puntos)
integral = trapecio(0,1,2)

% Integración de f(x) con la regla del trapecio compuesta entre 0 y 1 tomando 2 subintervalos (3 puntos)
integral2 = simpson1_3(0,1,2)

function s = trapecio(a,b,N)
    % Calculamos el paso
    h = (b-a)/N; 

    % Iniciamos la suma de la fórmula
    s = f(a);
    for k=1:(N - 1)
        s = s + 2*f(a+h*k);
    end
    s = s + f(b);

    % Multiplicamos por el factor h/2 de la fórmula
    s = h*s/2; 
end

function s = simpson1_3(a,b,N)
    % Calculamos el paso
    h = (b-a)/N;
    if rem(N,2) ~= 0
        disp('No es par')
        s=0/0;
    else  
        % Iniciamos las sumas de la fórmula
        s = f(a);
        for k=1:(N/2 - 1)
            s = s + 2*f(a+h*2*k);
        end
        for k=1:N/2
            s = s + 4*f(a+h*(2*k-1));
        end
        s = s + f(b);


        % Multiplicamos por el factor h/3 de la fórmula
        s = s*h/3;
    end
end

% Función a integrar
function y = f(x)
    y=x^2;
end
