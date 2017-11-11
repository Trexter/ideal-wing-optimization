function [constraint_fn] = formConstraintFunctionsDynamically(wing, max_shear, min_shear, shear_center)
% form all constraints for the nonlinear program
% FOS should all ready be taken into account

%compute the I func
I_func = formIFunctionDynamically(wing);

% form the maximum shear no yield and no buckle inequality (<= 0)
s = wing.stringer1;
cineq{1} = @(x)(max_shear * s.position(2) * s.area / I_func(x) - s.material.getYieldStrength)

end

