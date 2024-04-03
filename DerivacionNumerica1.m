clear; clc;

% Nube de puntos
x = 0:0.01:pi;
y = sin(x);

hold on
% Función
plot(x,y)

% Derivada numérica
yy = diff(x,y);
plot(x,yy)

% Derivada exacta
yyy = cos(x);
plot(x,yyy)

function dydx = diff(x,y)
    %% x e y son puntos obtenidos de interpolar una función
    %% dydx(i) aproxima la derivada de la función en el punto x(i)
    
    % Calculamos el paso de la nube de puntos
    h = x(2)-x(1);
    
    % Creamos un vector de la misma longitud que y
    dydx = y;
    
    % Aproximación de la derivada en el primer punto
    dydx(1) = ( y(2) - y(1) ) / h;

    % Aproximación de la derivada en el ultimo punto
    dydx(end) = ( y(end) - y(end-1) ) / h;

    % Aproximación en los puntos intermedios
    for k = 2:length(y)-1
        dydx(k) = (y(k+1)-y(k-1)) / (2*h);
    end
end
