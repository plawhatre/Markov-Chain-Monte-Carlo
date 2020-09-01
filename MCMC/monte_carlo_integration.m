clc,clear,close all
%using frequency approach
x=exprnd(1,1,1000);
xroot=sqrt(x);
exroothat=mean(xroot)
%using numerical integration
myfun=@(x)(sqrt(x).*exp(-x));
exrootru=integral(myfun,0,10)
x1=0:0.01:10;
x2=myfun(x1);
area(x1,x2)
msgbox('Thus we can calculate expectation using frequency approach as well as numerical integration')