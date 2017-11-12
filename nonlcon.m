function [c, ceq] = nonlcon(x, wing, max_shear, min_shear, shear_center)
% form all constraints for the nonlinear program
% FOS should all ready be taken into account

%!!!!!!!!!!!!!!!!!!!!
a = 1;

%compute the I
I_tot = computeITotal(x, wing)

% form the maximum shear no yield and no buckle inequality (<= 0)
index = 1;


s = wing.stringer1;
c = ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength);
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];

index = index + 1;

for s = wing.skin_tl.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];
end

%-=-=-=-=-=-=-=-=-=-=-=-



ceq = [];

end

