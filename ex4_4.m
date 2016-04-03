clear all
close all

c = [1:10];
w = [11:110];
xset = [];
for i = 1:length(c)
    for j =1:length(w)
        xset = [xset; c(i) w(j) ];
    end
end
randomIdx = randi(1000,1000,1);
xset = xset(randomIdx,:);
xset = xset';

syms t1 t2 x1 x2
t = [t1;t2];
x = [x1;x2];

L = t(1)*x(1)^t(2)*x(2)^(1-t(2));

grad = jacobian(L,t)';

Lfun = matlabFunction(L,'vars',{t,x});
gradfun = matlabFunction(grad,'vars',{t,x});

for i = 1:1000
    zset(i) = Lfun([2.5;0.7],xset(:,i))+0*randn;
end

theta = [1.0;0.5];
niter = 1000;
thetaset = [];
for i=1:niter
    a = 0.0015/(i+100)^0.501;
    theta = theta - a*(Lfun(theta,xset(:,i))-zset(i))*gradfun(theta,xset(:,i));
    thetaset = [thetaset theta];

end

plot(thetaset(1,:));
hold on
plot(thetaset(2,:));