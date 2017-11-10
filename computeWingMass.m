function [mass] = computeWingMass(wing)
%Simply computes the mass of this dynamic wing per meter length in kg

mass_fn = formObjectiveMassFunctionDynamically(wing);

mass = mass_fn(wing2DimensionVector(wing));

end

