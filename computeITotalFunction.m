function [I] = computeITotalFunction(x, wing)

% form a second moment of area function dynamically

index = 1;
vector_index = 1;

I = 0;

I = I + (x(vector_index) * wing.stringer1.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.skin_tl.stringers
    I = I + (x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

I = I + (x(vector_index) * wing.stringer2.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.skin_tm.stringers
    I = I + (x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

I = I + (x(vector_index) * wing.stringer3.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.skin_tr.stringers
    I = I + (x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

I = I + (x(vector_index) * wing.stringer4.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.web_r.stringers
    I = I + (x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

I = I + (x(vector_index) * wing.stringer5.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.skin_br.stringers
    I = I + (x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

I = I + (x(vector_index) * wing.stringer6.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.skin_bm.stringers
    I = I + (x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

I = I + (x(vector_index) * wing.stringer7.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.skin_bl.stringers
    I = I + (x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

I = I + (x(vector_index) * wing.stringer8.position(2)^2);

index = index + 1;
vector_index = vector_index + 2; % skip the skin

for s = wing.web_l.stringers
    I = I + (x(vector_index) * s.position(2)^2);
    index = index + 1;
    vector_index = vector_index + 1;
end

%-=-=-=-=-=-=

end

