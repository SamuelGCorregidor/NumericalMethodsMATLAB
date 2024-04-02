clear;
clc;

% Representación gráfica del punto fijo para resolver f(x)=x iniciando en x=0.41 con un error máximo de 0.0001
r = fijograf(0.4,1,0.41,0.0001,0.25)

function x = fijograf(a,b,x,error,tiempo)
    %% Representamos gráficamente en el intervalo [a,b] con pausas de tiempo
    hold on
    % Dibujamos la función
    plot(a:0.01:b,f(a:0.01:b),'k')

    % Dibujamos el eje y=0
    plot([a b],[0 0],'k') 

    % Dibujamos la recta x=y
    plot([a b],[a b],'k') 

    % Dibujamos punto de inicio
    plot(inicial,0,'*r')  

    % Primera iteración del punto fijo (del eje X a la función)
    plot([x x], [0 f(x)],'r') 
    pause(tiempo);
    
    while abs(f(x)-x) > error
        % Unimos el punto anterior de la función con la recta y=x
        plot([x f(x)],[f(x) f(x)],'r')
        pause(tiempo)

        % Iteración del punto fijo
        x = f(x);

        % Unimos el punto anterior de la recta y=x con la función
        plot([x x], [x f(x)],'r')
        pause(tiempo)
    end
    hold off
end

% Función
function y = f(x)
    y = cos(x);
end
