function [u_0, b_0, u_n, b_n] = bc(alpha, beta, h)
u_0(1) = alpha(1)+(3*alpha(2))/(2*h);
u_0(2) = -(2*alpha(2))/h;
u_0(3) = alpha(2)/(2*h);
b_0 = alpha(3);
u_n(3) = beta(1)+(3*beta(2))/(2*h);
u_n(2) = -(2*beta(2))/h;
u_n(1) = beta(2)/(2*h);
b_n = beta(3);
end
