function [mass, grad] = evaluateObjectiveMassFunction(x_query,mass_fn, grad_fn)

array = num2cell(x_query);
mass = feval(mass_fn, array{:});
grad = feval(grad_fn, array{:});

end

