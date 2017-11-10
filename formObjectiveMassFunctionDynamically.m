function [final_fn] = formObjectiveMassFunctionDynamically(wing)
%dynamically form a mass function to be minimized
%the order of x is like this: stringer area, skin thickness, [skin stringer
%areas], next stringer area, next skin thickness, [next skin stringer
%areas], etc...

index = 1; % the starting index of the x vector

%start with stringer1
final_fn = @(x)(x(index) * wing.stringer1.material.getDensity);
index = index + 1;

%top left skin and its stringers
temp_fn = @(x)(x(index) * wing.skin_tl.length * wing.skin_tl.material.getDensity);
final_fn = @(x)(final_fn(x) + temp_fn(x))

%TODO add the for loop for the skin stringers

end

