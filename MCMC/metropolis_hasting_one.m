clc,clear,close all
%target distribution
cauchy=@(x)(1./(1+x.^2));
%proposed distribution
norm=@(x,mu,sig)(1/sig*exp(-0.5*((x-mu)/sig).^2));
%generate 10000 samples in the chain
n=10000;
sig=2;
x=zeros(1,n);
x(1)=randn(1);
for i=2:n
    y=x(i-1)+sig*randn(1);
    u=rand(1);
    alpha=min([1,cauchy(y)*norm(x(i-1),y,sig)/(cauchy(x(i-1))*norm(y,x(i-1),sig))]);
    if u<=alpha
        x(i)=y;
    else
        x(i)=x(i-1);
    end
end
hist(x)