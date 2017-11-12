function [c, ceq] = nonlcon(x, wing, max_shear, min_shear, shear_center)
% form all constraints for the nonlinear program
% FOS should all ready be taken into account

%!!!!!!!!!!!!!!!!!!!!
a = 6.8;

%compute the I
I_tot = computeITotal(x, wing)

% form the maximum shear no yield and no buckle inequality (<= 0)
index = 1;


s = wing.stringer1;
c = [((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.skin_tl.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer2;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.skin_tm.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer3;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.skin_tr.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer4;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.web_r.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer5;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.skin_br.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer6;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.skin_bm.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer7;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.skin_bl.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer8;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))]

index = index + 2; % skip skin

for s = wing.web_l.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerI(x(index))/a^2))];
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

ceq = []

end

