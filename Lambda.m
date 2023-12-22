function lambda = Lambda(chi)
%strain magnification
%   Detailed explanation goes here
pp=1/3;
cc=0.2;
lambda=(chi-cc^pp)/(1-cc^pp);
end

