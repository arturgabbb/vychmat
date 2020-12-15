function [Q,R] = QR(A)
s = size(A);
n = s(1);
Q = eye(s);
R = A;
for j = 1:n-1
    for i = n:-1:j+1
        T = eye(s);
        theta = atan(-R(i,j)/R(j,j));
        T(i,i) = cos(theta);
        T(j,j) = T(i,i);
        T(i,j) =  sin(theta);
        T(j,i) =  -T(i,j);
        R = T*R;
        Q = Q*transpose(T);
    end
end
end
