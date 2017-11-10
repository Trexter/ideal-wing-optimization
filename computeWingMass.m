function [mass] = computeWingMass(wing)
%Simply computes the mass of this dynamic wing per meter length in kg

mass = 0;

%start with stringer1
mass = mass + wing.stringer1.area * wing.stringer1.material.getDensity;

%top left skin and its stringers
mass = mass + wing.skin_tl.

end

