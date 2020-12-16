function [y, lamb] = ScalarMet(A, eps)
    n = length(A);
    y = rand(n, 1);
    
    lamb = (y' * A * y)/(y' * y);
    
    inaccuracy = norm(A*y - lamb * y)/norm(y);
    
    iteration = 1;
    
    while inaccuracy > eps 
        y = (A * y) / norm(A * y);
        inaccuracy = abs(lamb-(y' * A * y)/(y' * y));
        lamb = (y' * A * y)/(y' * y);
        
        iteration = iteration + 1;
    end
     disp ('Количество итераций методом скалярных произведений =');
     disp( iteration);
end