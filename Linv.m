function app = Linv(x,nu)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if nu<1.04
    app=(3*x)/(1-x^3);
else
    app=3*x+(9/5)*x^3+(297/175)*x^5+(1539/875)*x^7+(126117/67375)*x^9+(43733439/21896875)*x^11+...
        (231321177/109484375)*x^13+(20495009043/9306171875)*x^15+(1073585186448381/476522530859375)*x^17+...
        (4387445039583/1944989921875)*x^19;
end
end

