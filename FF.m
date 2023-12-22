function FF = FF(chi,omega)
%deformation matrix
F_hat=[chi 0 0;0 1/sqrt(chi) 0;0 0 1/sqrt(chi)];
%rotation matrix
rad=deg2rad(omega);
RM=[cos(rad) -sin(rad) 0;sin(rad) cos(rad) 0; 0 0 1];
%deformation in the omega direction
FF=RM.'*F_hat*RM;
end

