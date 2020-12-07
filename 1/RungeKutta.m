function [t, y] = RungeKutta(t0, y0, h, tn, A)
    t = (t0:h:tn)';
    y = zeros(rank(A), length(t));
    
    y(:,1) = y0;
    for i = 1:1:length(t)-1
        k1 = h * A * y(:,i);
        k2 = h * A * (y(:,i) + k1 / 2);
        k3 = h * A * (y(:,i) + k2 / 2);
        k4 = h * A * (y(:,i) + k3);
        y(:,i+1) = y(:,i) + (k1 + 2 * k2 + 2 * k3 + k4) / 6;
    end
end
