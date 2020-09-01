clc,clear,close all
z1=125;
z2=18;
z3=20;
z4=34;
n=1100;
a=0.1;
theta=zeros(1,n);
strg='((2+th).^z1).*((1-th).^(z2+z3)).*((th).^z4)';
ptheta=inline(strg,'th','z1','z2','z3','z4');
theta(1)=rand(1);
for i=2:n
    y=theta(i-1)-a+2*a*rand(1);
    u=rand(1);
    alpha=min([ptheta(y,z1,z2,z3,z4)/ptheta(theta(i-1),z1,z2,z3,z4),1]);
    if u<=alpha
        theta(i)=y;
    else
        theta(i)=theta(i-1);
    end
end
hist(theta)