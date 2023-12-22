clc;
clear all;
%define the parameters
chi=1.7;
chi_m=1.7;

omega0=90;

theta=70.5;
Nc=1.8141;
nc=100;
N0=2.835;
R0=6.406;
n_max=100;

alpha=((1-cos(deg2rad(theta)))/(1+cos(deg2rad(theta))))^2;
a=alpha^2/cos(deg2rad(theta)/2);
b=cos(deg2rad(theta/2))^2/alpha^2;

% R_bar=6.406;
nu=1.0065;

%F_hat=[lambda 0 0;0 1/sqrt(lambda) 0;0 0 1/sqrt(lambda)];
F=FF(chi,omega0);
J=det(F);
%history of strechs
n_history=1;
lambda_history=[1.75];
omega_history=[0];



int_data = importdata('intpoints.dat');
x_c=int_data(:,1);
y_c=int_data(:,2);
z_c=int_data(:,3);
w_c=int_data(:,4);

[num_c,none]=size(w_c);
%strain amplification
pp=1/3;
cc=0.2;
% lambda_pp=(chi-cc^pp)/(1-cc^pp);

%3-dimensional generation
d=[x_c y_c z_c];

chi_i=[];
for j=1:num_c
    chi_i(end+1)=sqrt(d(j,:)*F*F*d(j,:).');
end

chi_i_max=[];
chi_di_m=[];
chi_i_m=[];
if n_history>=1  %history of anisotropic 
    for j=1:num_c
        for k=1:n_history
            chi_i_max(end+1)=max(1,sqrt(d(j,:)*FF(lambda_history(k),omega_history(k))*FF(lambda_history(k),omega_history(k))*d(j,:).'));
        end
    end
else
    chi_i_max=ones(1,num_c);
end
for j=1:num_c
    chi_di_m(end+1)=sqrt(d(j,:)*FF(chi_m,omega0)*FF(chi_m,omega0)*d(j,:).');
    chi_i_m(end+1)=max([chi_i_max(j),chi_i(j),chi_di_m(j)]);
end

%Macroscale behavior
Pc=[];
Pp=[];
for j=1:num_c
    Pc(end+1)=Nc*sqrt(b*nc)*Linv((chi_i(j)/sqrt(b*nc)),nu);
    
    Pp(end+1)=R0/a*N0/(1-cc^pp)*Phi(Lambda(chi_i_m(j)))*...
        integral(@(n) Linv(R0*Lambda(chi_i(j))/(a*b*n),nu)*P(n,R0,theta),DD(Lambda(chi_i_m(j)),theta,nu,R0),n_max,'ArrayValued',true);
end


DOD_i=[];

for j=1:num_c
    dod=d(j,:).'*d(j,:);
    DOD_i(end+1)=DD_n(chi,dod);
end

P_n=[];
for k=1:num_c
    P_n(end+1)=(Pc(k)+Pp(k))*(w_c(k)/chi_i(k))*J^(-1/3)*DOD_i(k);
end

first_poila=P_n(1);
y_seq=[first_poila];
for i=2:num_c
    first_poila=first_poila+P_n(i);
    y_seq(end+1)=first_poila;
end
% 
% plot_interval=0.05;
% x_seq=[];
% for i=0:plot_interval:chi
%     x_seq(end+1)=i;
% end
%                 
final_stretch=1.7;



    





