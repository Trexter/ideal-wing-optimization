function [wing] = globalDimensionSearch(wing, max_shear, min_shear, shear_center)

gs = GlobalSearch;

[m, g] = formObjectiveMassFunction(wing); % we seek to minimize this function

[c, ceq, dc, dceq] = formNonLinearConstraintsFunctions(wing, max_shear, min_shear, shear_center); % subject to these constraints

x0 = wing2DimensionVector(wing); % initial guess of the wing dims

ub = ones(1, length(x0));
lb = ones(1, length(x0)) * 0.0005;

options = optimoptions(@fmincon,'Algorithm','sqp');
options = optimoptions(options,'SpecifyObjectiveGradient',true,'SpecifyConstraintGradient',true);

problem = createOptimProblem('fmincon','x0',x0,...
    'objective',@(x)evaluateObjectiveMassFunction(x, m, g),...
    'lb',lb,'ub',ub, 'nonlcon', @(x)evaluateNonLinearConstraints(x, c, ceq, dc, dceq), ...
    'options', options);

[x_optim, new_mass] = run(gs,problem);

new_mass

[wing] = dimensionVector2Wing(wing, x_optim);

end

