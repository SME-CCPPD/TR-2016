x=[1 1.2 2 3 3.9 4.6 5.4 6];
y=[50 40 30 50 45 70 80 500];
p=(polyfit(x, y, length(x)));
X=[x(1):0.01:x(end)];
g=length(x);
%Y=p(1)*(X.^(g-1))+p(2)*(X.^(g-2))+p(3)*(X.^(g-3))+p(4)*(X.^(g-4))+p(5)*(X.^(g-5))+p(6)*(X.^(g-6))+p(7)*(X.^(g-7))+p(8)*(X.^(g-8));
Y=polyval(p, X);
plot(x, y, "*",X,Y)