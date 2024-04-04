clear; clc;

% Matriz de la cual calcularemos sus círculos de Gerschgorin
A = [1+i 1-i; 2+2i -4+5i];

[C,R] = circulosGers(A)

function [C,R] = circulosGers(A)
    %% A es una matriz cuadrada, C los centros de los círculos de Gerschgorin
    %% R los radios obtenidos en el mismo orden que los centros
    
    % Centros
    C = diag(A);

    % Distinguimos parte real e imaginaria para representar los círculos
    ReC = real(C);
    ImC = imag(C);

    % Aplicamos abs para poder sumar sus elementos y calcular los radios
    A = abs(A);
    % Sumamos los elementos de la 2a dimensión del arreglo A, es decir, las filas de la matriz A
    R = sum(A,2);
    
    % Representamos los círculos en el plano complejo
    hold on
    
    % Centros de los círculos
    plot(ReC,ImC,'*')

    for k = 1:length(R)
        % Ecuación de los círculos
        % (x-ReC)^2 + (y-ImC)^2 = R^2
        % En paramétricas:
        % x-ReC = Rcos(t)
        % y-ImC = Rsen(t)
        t = 0:0.01:2*pi;
        x = ReC(k) + R(k) * cos(t);
        y = ImC(k) + R(k) * sin(t);
        plot(x,y,'r')
    end
    hold off
end
