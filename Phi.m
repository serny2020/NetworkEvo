function phi = Phi(lambda_max)
%density probability
%   Detailed explanation goes here
n_max=100;
theta=70.5;
nu=1.0065;
N0=2.835;
R0=6.406;
N=DD(lambda_max,theta,nu,R0);
fun=@(lambda_max) N*P(N,R0,theta);
mid=integral(fun,N,n_max,'ArrayValued',true);%,'ArrayValued',true
phi=1/mid;
N_hat=N0*phi;
end

