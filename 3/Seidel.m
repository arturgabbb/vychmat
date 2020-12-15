function [x] = Seidel(A, b, eps)
    D = diag(diag(A));
    
    L = tril(A, -1);
    R = triu(A, 1);
    
    H = zeros(size(A)) - inv(D + L) * R;
    g = inv(D + L) * b;
    
    
    x0 = zeros(length(b), 1);
    
   if (max(max(abs(H))) <= 1)
        x = H*x0 + g;
    
        iteration = 1;
    
        while norm(x - x0) > eps
            iteration = iteration + 1;
        
            c = x;
        
            x = H * x + g;
        
            x0 = c;
        end
    
    
    else
        disp('Spectral rad > 1');
        x = x0;
        iteration = 0;

    end
    disp('Количество итераций: ')
    disp(iteration);
end