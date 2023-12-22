clc;
clear all;
R0=6.406;
theta=70.5;
y_val=[];
x_val=[];

alp=((1-cos(deg2rad(theta)))/(1+cos(deg2rad(theta))))^2;
a=alp^2/cos(deg2rad(theta)/2);
b=cos(deg2rad(theta/2))^2/alp^2;
low=ceil(R0/(a*b));

% for n=0:0.1:100
%     y_val(end+1)=P(n,R0,theta);
%     x_val(end+1)=n;
% end
% plot(x_val,y_val)

n=linspace(0,100);
y=P(n,R0,theta);
plot(n,y)


nu=1.0065;
vir_limit=R0/(a*b)
lambda = Lambda(1.7);
low_limit=lambda*nu*R0/(a*b)

integral(@(n) P(n,R0,theta),0,20)
