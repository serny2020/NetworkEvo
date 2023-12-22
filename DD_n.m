function dd_n = DD_n(chi,dod)
%return the value of F(DXD)
% 


omega=-90;
RM=[cos(deg2rad(omega)) -sin(deg2rad(omega)) 0;sin(deg2rad(omega)) cos(deg2rad(omega)) 0; 0 0 1];
F=FF(chi,omega);
dod_p=(F*dod);
pl=dod_p(3,3)*F(3,3);
b=(RM.'*(F*dod-pl*F.'^(-1))*RM);
dd_n=b(1,1);

end

