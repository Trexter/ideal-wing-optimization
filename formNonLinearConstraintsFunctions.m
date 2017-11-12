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


[add_c, dp_vec] = formYieldBuckleConstraints(wing, x, max_shear, I_tot, a);

c = add_c;

[add_c, dp_vec] = formYieldBuckleConstraints(wing, x, min_shear, I_tot, a);

c = [c, add_c];

syms q0;

q_vec = formShearFlows(q0, dp_vec);

%-=-=-=-=-=-=-=-=-=-=-=- 
ceq = [];


%=-=-=-=-=-diff and form-=-=-=-=

c_fn = matlabFunction(c, 'vars', x);
ceq_fn = matlabFunction(ceq, 'vars', x);

DC_fn = matlabFunction(jacobian(c, x)', 'vars', x);
DCeq_fn = matlabFunction(jacobian(ceq, x), 'vars', x);

end

