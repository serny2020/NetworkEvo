function P = P(n,R_bar,theta)
%Statistical mechanics of a single chain

kappa=14.824;

alp=((1-cos(deg2rad(theta)))/(1+cos(deg2rad(theta))))^2;

A=-alp*R_bar^2./n-kappa*sqrt(alp/pi)*(2.*sqrt(n).*exp(-alp*R_bar^2./n)+...
    2*R_bar*sqrt(pi*alp)*(erf(R_bar*sqrt(alp./n))-erf(R_bar*sqrt(alp)))-2*exp(-alp*R_bar^2));
P=kappa*sqrt(alp/pi./n).*exp(A);

end

