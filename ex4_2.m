clear all
close all

syms t1 t2
t = [t1;t2];

L = t(1)^4+t(1)^2+t(1)*t(2)+t(2)^2;

grad = jacobian(L,t)';

Lfun = matlabFunction(L,'vars',{t});
gradfun = matlabFunction(grad,'vars',{t});


x = [1;1];

niter = 4000;
Lset = [];
xset = [];
for i=1:niter
    a = 0.1/(i);
    x = x - a*(gradfun(x)+0.1*randn(2,1));
    Lset = [Lset;Lfun(x)];
    xset = [xset x];
end

figure(1)
plot(Lset);
hold on;
plot(xset(1,:));
plot(xset(2,:));
legend('L','x1','x2')

x = [1;1];
Lset = [];
xset = [];
for i=1:niter
    a = 0.1/(i)^0.501;
    x = x - a*(gradfun(x)+0.1*randn(2,1));
    Lset = [Lset;Lfun(x)];
    xset = [xset x];
end
% use larger steps gives fast convergence when sigma=0.1
figure(2)
plot(Lset);
hold on;
plot(xset(1,:));
plot(xset(2,:));
legend('L','x1','x2')
x = [1;1];
Lset = [];
xset = [];
for i=1:niter
    a = 0.1/(i);
    x = x - a*(gradfun(x)+1*randn(2,1));
    Lset = [Lset;Lfun(x)];
    xset = [xset x];
end

figure(3)
plot(Lset);
hold on;
plot(xset(1,:));
plot(xset(2,:));
legend('L','x1','x2')

x = [1;1];
Lset = [];
xset = [];
for i=1:niter
    a = 0.1/(i)^0.501;
    x = x - a*(gradfun(x)+1*randn(2,1));
    Lset = [Lset;Lfun(x)];
    xset = [xset x];
end
% use larger steps gives unstable result when sigma=1 but is still better
% than the former one
figure(4)
plot(Lset);
hold on;
plot(xset(1,:));
plot(xset(2,:));
legend('L','x1','x2')

