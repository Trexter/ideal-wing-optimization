function [c, dp_vec] = formYieldBuckleConstraints(wing, x, shear, I_tot, a)

% form the maximum shear no yield and no buckle inequality (<= 0)
index = 1;


s = wing.stringer1;

dp_vec = (shear * s.position(2) * x(index) / I_tot);

c = [((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.skin_tl.stringers
    
    dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];
    
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer2;

dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];

c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.skin_tm.stringers
    
    dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];
    
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer3;

dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];

c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.skin_tr.stringers
    
    dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];
    
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer4;

dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];

c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.web_r.stringers
    
    dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];
    
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer5;

dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];

c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.skin_br.stringers
    
    dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];
    
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer6;

dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];

c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.skin_bm.stringers
    
    dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];
    
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer7;

dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];

c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

index = index + 2; % skip skin

for s = wing.skin_bl.stringers
    
    dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];
    
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer8;

dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];

c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))]

index = index + 2; % skip skin

for s = wing.web_l.stringers
    
    dp_vec = [dp_vec, (shear * s.position(2) * x(index) / I_tot)];
    
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - s.material.getYieldStrength)];
%c(c_index) = (shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((dp_vec(length(dp_vec)) / x(index)) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    index = index + 1;
end

end

