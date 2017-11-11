function [constraint_fn] = formConstraintFunctionsDynamically(wing, max_shear, min_shear, shear_center)
% form all constraints for the nonlinear program
% FOS should all ready be taken into account

%!!!!!!!!!!!!!!!!!!!!
a = 0.75;

%compute the I func
I_func = formIFunctionDynamically(wing);

% form the maximum shear no yield and no buckle inequality (<= 0)
index = 1;
cineq_index = 1;

s = wing.stringer1;
cineq{cineq_index} = @(x)(max_shear * s.position(2) * x(index) / I_func(x) - s.material.getYieldStrength)
cineq_index = cineq_index + 1;

cineq{cineq_index} = @(x)((max_shear * s.position(2) * x(index) / I_func(x)) - (pi^2*s.material.getYoungsModulus*I_func(x)/a^2))

index = index + 2; %skip skin buckle for now

% convert all cineqs to one function
cineq_vector = @(x)(cellfun(@(y) y(x), cineq))
cineq_vector(wing2DimensionVector(wing))

%combine ceqs and cineqs
constraint_fn = @(x){cineq_vector(x), 0}

end

