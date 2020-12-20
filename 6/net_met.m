function [u, x] = net_met(x_0, h, x_n, q, r, f, alpha, beta)
[u_0, b_0, u_n, b_n] = bc(alpha, beta, h);
x = x_0:h:x_n;
n = length(x);
A = zeros(n);

A(1,1:3) = u_0;
b = zeros(1,n);
q_x = zeros(1,n-2);

if ~(f(x) == 0)
    b(2:n-1) = f(x(2:n-1));
end
b(1) = b_0;
b(n) = b_n;
if ~(q(x) == 0)
    q_x = q(x(2:n-1));
end
r_x = r(x(2:n-1));

for i=2:n-1
    A(i,i-1) = 1/h^2-q_x(i-1)/(2*h);
    A(i,i) = -(2/h^2 + r_x(i-1));
    A(i,i+1) = 1/h^2 + q_x(i-1)/(2*h);
end

A(n,n-2:n) = u_n;

u = A\b';
end
