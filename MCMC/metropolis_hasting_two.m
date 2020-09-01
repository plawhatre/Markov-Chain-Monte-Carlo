clc,clear,close all
sig1=0.5;
sig2=0.1;
sig3=10;
n=50000;
x1=zeros(1,n);
x2=x1;
x3=x1;
x1(1)=-10;
x2(1)=0;
x3(1)=0;
%run first chain
for i=2:n
    y=rand(1)*sig1+x1(i-1);
    u=rand(1);
    alpha=normpdf(y,0.1)/normpdf(x1(i-1),0,1);
    if u<=alpha
        x1(i)=y;
    else
        x1(i)=x2(i-1);
    end
end
%run second chain
for i=2:n
    y=rand(1)*sig2+x2(i-1);
    u=rand(1);
    alpha=normpdf(y,0.1)/normpdf(x2(i-1),0,1);
    if u<=alpha
        x2(i)=y;
    else
        x2(i)=x2(i-1);
    end
end
%run first chain
for i=2:n
    y=rand(1)*sig3+x3(i-1);
    u=rand(1);
    alpha=normpdf(y,0.1)/normpdf(x3(i-1),0,1);
    if u<=alpha
        x3(i)=y;
    else
        x3(i)=x3(i-1);
    end
end
plot(1:n,x1)
figure
plot(1:n,x2)
figure
plot(1:n,x3)