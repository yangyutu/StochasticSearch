clear all
close all

% a super simple/naive steepest gradient to demostrate how to use symbol
% matlab for optimization prototype

syms t1 t2

t = [t1;t2];
L = ((t(1)-2)^4 + (t(1)-2*t(2))^2);

Lfun = matlabFunction(L,'vars',{t});
grad = (jacobian(L,t))';
gx = matlabFunction(grad,'vars',{t});

Hessf = (jacobian(grad,t))';
Hx = matlabFunction(Hessf,'vars',{t});

Lfun([2;1])
x=[1;0];
a = 0;
count = 0;
while norm(gx(x)) >1e-3
    count = count+1;
    a = 1/(count+1);
    x = x - a*gx(x)
    Lfun(x)
end



