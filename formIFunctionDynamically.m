function [I_func] = formIFunctionDynamically(wing)
% form a second moment of area function dynamically

index = 1;
vector_index = 1;

contribution_func{index} = @(x)(x(vector_index) * wing.stringer1.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.skin_tl.stringers
    contribution_func{index} = @(x)(x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

contribution_func{index} = @(x)(x(vector_index) * wing.stringer2.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.skin_tm.stringers
    contribution_func{index} = @(x)(x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

contribution_func{index} = @(x)(x(vector_index) * wing.stringer3.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.skin_tr.stringers
    contribution_func{index} = @(x)(x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

contribution_func{index} = @(x)(x(vector_index) * wing.stringer4.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.web_r.stringers
    contribution_func{index} = @(x)(x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

contribution_func{index} = @(x)(x(vector_index) * wing.stringer5.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.skin_br.stringers
    contribution_func{index} = @(x)(x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

contribution_func{index} = @(x)(x(vector_index) * wing.stringer6.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.skin_bm.stringers
    contribution_func{index} = @(x)(x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

contribution_func{index} = @(x)(x(vector_index) * wing.stringer7.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.skin_bl.stringers
    contribution_func{index} = @(x)(x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

contribution_func{index} = @(x)(x(vector_index) * wing.stringer8.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.web_l.stringers
    contribution_func{index} = @(x)(x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

I_func = @(x) sum(cellfun(@(y) y(x), contribution_func))

end

