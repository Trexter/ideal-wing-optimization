function [c, ceq, DC, DCeq] = evaluateNonLinearConstraints(x_query, c_fn, ceq_fn, dc_fn, dceq_fn)

array = num2cell(x_query);
c = feval(c_fn, array{:});
ceq = feval(ceq_fn, array{:});
DC = feval(dc_fn, array{:});
DCeq = feval(dceq_fn, array{:});

end

