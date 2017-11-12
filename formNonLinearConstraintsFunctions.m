function [c_fn, ceq_fn, DC_fn, DCeq_fn] = formNonLinearConstraintsFunctions(wing, max_shear, min_shear, shear_center)
%symbollically form all constraints

%get number of dimensions in wing
wing_dim = length(wing2DimensionVector(wing));

%form a symbolic vector to represent x_query
x = sym('x', [1, wing_dim], 'real');

% form all constraints for the nonlinear program
% FOS should all ready be taken into account

%!!!!!!!!!!!!!!!!!!!!
a = 0.75;

%compute the I
I_tot = computeITotalFunction(x, wing);


[add_c, dp_vec] = formYieldBuckleConstraints(wing, x, max_shear, I_tot, a);

c = add_c;

[add_c, dp_vec] = formYieldBuckleConstraints(wing, x, min_shear, I_tot, a);

c = [c, add_c];

%-=-=-=-=-=-=-=-=-=-=-=- 
ceq = [];

syms q0;

q_vec = formShearFlows(q0, dp_vec);

torsion_sum = formTorsionSum(wing, x, q_vec);

moment_sum = formMomentSum(wing, q_vec);

q0_solved = solve(moment_sum == 0.35 * max_shear, q0);

q_vec_final = (subs(q_vec, q0, q0_solved));

[add_c] = formSkinBuckleConstraint(wing, x, q_vec_final);

c = [c, add_c];

ceq = subs(torsion_sum, q0, q0_solved);
ceq(2) = x(3) - x(5);

%=-=-=-=-=-diff and form-=-=-=-=

c_fn = matlabFunction(c, 'vars', x);
ceq_fn = matlabFunction(ceq, 'vars', x);

DC_fn = matlabFunction(jacobian(c, x)', 'vars', x);
DCeq_fn = matlabFunction(jacobian(ceq, x)', 'vars', x);

end

