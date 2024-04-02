clear; clc;

% Puntos que vamos a interpolar
h = 0.5;
x = 0:h:2*pi;
y = cos(x);

%Interpolación de splines cuadráticos con pendiente inicial m=0
A = spline(x,y,0);

hold on
% Paso tomado en la representación gráfica de los splines
h = 0.01; 

% Representamos todos los Splines
for k = 1:(length(x)-1) 
    a = x(k):h:x(k+1);
    b = A(k,1) * a.^2 + A(k,2) * a + A(k,3);
    plot(a,b,'b')
end

%Interpolación lineal
plot(x,y,'g')

%Puntos a interpolar
plot(x,y,'*r')

function A = spline(x,y,m)
    %% x e y son los puntos a interpolar
    %% m es la primera pendiente a tomar
    % Para n+1 puntos vamos a calcular n + 1 = lenght(x) splines, guardando los coeficientes en una matriz
    A = zeros(length(x)-1,3);
    
    % Calculamos el primer spline S1(x) = ax^2 + bx + c
    % CONDICIONES:
    % S1'(x1) = m ==> 2ax1 + b = m
    % S1(x1) = y1 ==> ax1^2 + bx1 + c = y1
    % S1(x2) = y2 ==> ax2^2 + bx2 + c = y2
    M = [2*x(1) 1 0;
         x(1)^2 x(1) 1;
         x(2)^2 x(2) 1];
    c = [m; y(1); y(2)];
    
    % Resolvemos el sistema y obtenemos los coeficientes
    A(1,:) = M\c;
    
    % Calculamos el resto en bucle
    for k = 2:(length(x)-1)
        % Condiciones para el k-ésimo:
        % Sk'(xk) = Sk-1 '(xk) ==> 2axk + b = 2A(,1)xk + A(,2)
        % Sk(xk) = yk ==> axk^2 + bxk + c = yk
        % Sk(xk+1) = yk+1 ==> ax(k+1)^2 + bx(k+1) + c = y(k+1)
        M = [2*x(k) 1 0;
             x(k)^2 x(k) 1;
             x(k+1)^2 x(k+1) 1];
        c = [2*A(k-1,1)*x(k) + A(k-1,2); y(k); y(k+1)];
        
        % Resolvemos el sistema y obtenemos los coeficientes
        A(k,:) = M\c;
    end
end
