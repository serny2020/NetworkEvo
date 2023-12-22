function n_cf = DD(lambda_max,theta,nu,R0)
%This function calculate the low boundary of the activative segament 
%   
alpha=((1-cos(deg2rad(theta)))/(1+cos(deg2rad(theta))))^2;%0.27;
a=alpha^2/cos(deg2rad(theta)/2);%2.44;
b=cos(deg2rad(theta/2))^2/alpha^2;%0.33;

n_cf=(nu*lambda_max*R0)/(a*b);

end

