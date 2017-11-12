function [mass, grad] = evaluateObjectiveMassFunction(x_query,mass_fn, grad_fn)

x = sym('x', [1, length(x_query)], 'real');

mass = double(subs(mass_fn, x, x_query));
grad = double(subs(grad_fn, x, x_query));

end

