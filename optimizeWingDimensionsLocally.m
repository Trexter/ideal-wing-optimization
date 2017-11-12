function [new_wing] = optimizeWingDimensionsLocally(wing, max_shear, min_shear, shear_center)
    
    [m, g] = formObjectiveMassFunction(wing); % we seek to minimize this function
    
    [c, ceq, dc, dceq] = formNonLinearConstraintsFunctions(wing, max_shear, min_shear, shear_center); % subject to these constraints
    
    x0 = wing2DimensionVector(wing); % initial guess of the wing dims
    
    ub = ones(1, length(x0));
    lb = zeros(1, length(x0));
    
    [x_optim, new_mass] = fmincon(@(x)evaluateObjectiveMassFunction(x, m, g), x0, zeros(length(x0)), zeros(length(x0), 1), zeros(length(x0)), zeros(length(x0), 1), lb, ub, @(x)evaluateNonLinearConstraints(x, c, ceq, dc, dceq));
    
    new_wing = dimensionVector2Wing(wing, x_optim);
    
    disp(x_optim)
    
    disp(new_mass)
end

