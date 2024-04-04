clear; clc;

% Método de las raices dobles para resolver f(x)=0
r = metodo(1,0.0001)

function x = metodo(x,error)
%% Método de las raíces dobles con aproximación inicial x y error controlado
    while abs(f(x)) > error
        x = x - ( f(x) * df(x) ) / ( (df(x))^2 - f(x) * ddf(x) );
    end
end

% Función
function y = f(x)
    y = x*exp(x) - exp(x) + 1;
end

% Derivada
function y = df(x)
    y = x *exp(x);
end

% Segunda derivada
function y = ddf(x)
    y = x *exp(x) + exp(x);
end
