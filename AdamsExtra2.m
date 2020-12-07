function [t, y] = AdamsExtra2(t0, y0, h, tn, A)
    W1 = eye(size(A))+A*h*3/2;
    W2 =  h*A/2;
   
    t = (t0:h:tn)';
    y = zeros(rank(A), length(t));
    
    y(:,1) = y0;
    
    [~, eulerReverse] = EulerReverse(t0, y0, h, t0+h, A);
    
    y(:,2) = eulerReverse(:,2);
    for i = 2:length(t)-1
        y(:,i+1) = W1 * y(:,i) - W2 * y(:, i-1);
    end
end
