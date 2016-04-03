clear all
close all

syms a b c

A = [1 a a^2;1 b b^2;1 c c^2];

L = -(det(A))^2;

Lfun = matlabFunction(L,'vars',{[a b c]});

niter = 10000;
Lfun([1,2,3]);
Lset = [];

for i = 1 : niter
    x = (rand(niter,3)-0.5)*2;
    Lset = [Lset;Lfun(x(i,:))];
end

min(Lset)