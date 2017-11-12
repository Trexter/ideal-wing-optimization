function [c_fn, ceq_fn, DC_fn, DCeq_fn] = formNonLinearConstraintsFunctions(wing, max_shear, min_shear, shear_center)
%symbollically form all constraints

%get number of dimensions in wing
wing_dim = length(wing2DimensionVector(wing));

%form a symbolic vector to represent x_query
x = sym('x', [1, wing_dim], 'real');

% form all constraints for the nonlinear program
% FOS should all ready be taken into account

%!!!!!!!!!!!!!!!!!!!!
a = 1;

%compute the I
I_tot = computeITotalFunction(x, wing);

% form the maximum shear no yield and no buckle inequality (<= 0)
index = 1;


s = wing.stringer1;
c = [((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

dp_vec = (max_shear * s.position(2) * x(index) / I_tot);

index = index + 2; % skip skin

for s = wing.skin_tl.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer2;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];
index = index + 2; % skip skin

for s = wing.skin_tm.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer3;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];

index = index + 2; % skip skin

for s = wing.skin_tr.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer4;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];

index = index + 2; % skip skin

for s = wing.web_r.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer5;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];

index = index + 2; % skip skin

for s = wing.skin_br.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer6;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];

index = index + 2; % skip skin

for s = wing.skin_bm.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer7;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];

dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];

index = index + 2; % skip skin

for s = wing.skin_bl.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-

s = wing.stringer8;
c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))]

dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];

index = index + 2; % skip skin

for s = wing.web_l.stringers
    c = [c, ((max_shear * s.position(2) / I_tot) - s.material.getYieldStrength)];
%c(c_index) = (max_shear * s.position(2) * x(index) / I_func(x))
    c = [c, ((max_shear * s.position(2) / I_tot) - (pi^2*s.material.getYoungsModulus*computeStringerIFunction(x(index))/a^2))];
    
    dp_vec = [dp_vec, (max_shear * s.position(2) * x(index) / I_tot)];
    
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-=-=-
ceq = [];




%=-=-=-=-=-diff and form-=-=-=-=

c_fn = matlabFunction(c, 'vars', x);
ceq_fn = matlabFunction(ceq, 'vars', x);

DC_fn = matlabFunction(jacobian(c, x)', 'vars', x);
DCeq_fn = matlabFunction(jacobian(ceq, x), 'vars', x);

end

