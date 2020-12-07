function [t, y] = EulerReverse(t0, y0, h, tn, A)
    W = inv(eye(size(A))-A*h);
    
    t = (t0:h:tn)';
    y = zeros(rank(A), length(t));
    
    y(:,1) = y0;
    for i = 1:1:length(t)-1
        y(:,i+1) = W * y(:,i);
    end
end