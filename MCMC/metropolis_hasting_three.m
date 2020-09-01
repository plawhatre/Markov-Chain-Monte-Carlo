clc,clear,close all
n=6000;
xar=zeros(n,2);
mu=[1;2];
covm=[1 0.9;0.9 1];
norm='(exp(-0.5*(x-mu)''*inv(covm)*(x-mu)))';
norm=inline(norm,'x','mu','covm');
xar(1,:)=randn(1,2);
for i=2:n
    y=mu-(xar(i-1,:)'-mu)+(-1+2*rand(2,1));
    u=rand(1);
    alpha=min([1,norm(y,mu,covm)/norm(xar(i-1,:)',mu,covm)]);
    if u<=alpha
        xar(i,:)=y;
    else
        xar(i,:)=xar(i-1);
    end
end
scatter(xar(:,1),xar(:,2),'filled','k')
x=[mean(xar(:,1));mean(xar(:,2))];

