function [y, lamb] = StepMet(A, eps)
    n = length(A);
    y = rand(n, 1);
    y(1)=max(y);
    yk = A * y;
    
    y = yk;
    
    lamb = yk(1) / y(1);
    
    inaccuracy = 1;
    
    iteration = 1;
    
    while inaccuracy > eps
        inaccuracy = lamb;
        yk = A * y;
        lamb = yk(1) / y(1);
        inaccuracy = abs(inaccuracy-lamb);
        iteration = iteration + 1;
        y = yk / norm(A * y);
    end
    disp ('Количество итераций степенным методом =');
    disp( iteration);
end