function [final_fn] = formObjectiveMassFunctionDynamically(wing)
%dynamically form a mass function to be minimized
%the order of x is like this: stringer area, skin thickness, [skin stringer
%areas], next stringer area, next skin thickness, [next skin stringer
%areas], etc...

index = 1; % the starting index of the x vector

%start with stringer1
mass_fn{index} = @(x)(x(index) * wing.stringer1.material.getDensity);
index = index + 1;

%top left skin and its stringers
mass_fn{index} = @(x)(x(index) * wing.skin_tl.length * wing.skin_tl.material.getDensity);
index = index + 1;

%skin stringers
for s = wing.skin_tl.stringers
    mass_fn{index} = @(x)(x(index) * s.material.getDensity);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-

%stringer2
mass_fn{index} = @(x)(x(index) * wing.stringer2.material.getDensity);
index = index + 1;

%top middle skin and its stringers
mass_fn{index} = @(x)(x(index) * wing.skin_tm.length * wing.skin_tm.material.getDensity);
index = index + 1;

%skin stringers
for s = wing.skin_tm.stringers
    mass_fn{index} = @(x)(x(index) * s.material.getDensity);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-

%stringer3
mass_fn{index} = @(x)(x(index) * wing.stringer3.material.getDensity);
index = index + 1;

%top right skin and its stringers
mass_fn{index} = @(x)(x(index) * wing.skin_tr.length * wing.skin_tr.material.getDensity);
index = index + 1;

%skin stringers
for s = wing.skin_tr.stringers
    mass_fn{index} = @(x)(x(index) * s.material.getDensity);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-

%stringer4
mass_fn{index} = @(x)(x(index) * wing.stringer4.material.getDensity);
index = index + 1;

%right web and its stringers
mass_fn{index} = @(x)(x(index) * wing.web_r.length * wing.web_r.material.getDensity);
index = index + 1;

%skin stringers
for s = wing.web_r.stringers
    mass_fn{index} = @(x)(x(index) * s.material.getDensity);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-

%stringer5
mass_fn{index} = @(x)(x(index) * wing.stringer5.material.getDensity);
index = index + 1;

%bottom right skin and its stringers
mass_fn{index} = @(x)(x(index) * wing.skin_br.length * wing.skin_br.material.getDensity);
index = index + 1;

%skin stringers
for s = wing.skin_br.stringers
    mass_fn{index} = @(x)(x(index) * s.material.getDensity);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-

%stringer6
mass_fn{index} = @(x)(x(index) * wing.stringer6.material.getDensity);
index = index + 1;

%bottom middle skin and its stringers
mass_fn{index} = @(x)(x(index) * wing.skin_bm.length * wing.skin_bm.material.getDensity);
index = index + 1;

%skin stringers
for s = wing.skin_bm.stringers
    mass_fn{index} = @(x)(x(index) * s.material.getDensity);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-

%stringer7
mass_fn{index} = @(x)(x(index) * wing.stringer7.material.getDensity);
index = index + 1;

%bottom left skin and its stringers
mass_fn{index} = @(x)(x(index) * wing.skin_bl.length * wing.skin_bl.material.getDensity);
index = index + 1;

%skin stringers
for s = wing.skin_bl.stringers
    mass_fn{index} = @(x)(x(index) * s.material.getDensity);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-

%stringer8
mass_fn{index} = @(x)(x(index) * wing.stringer8.material.getDensity);
index = index + 1;

%web left and its stringers
mass_fn{index} = @(x)(x(index) * wing.web_l.length * wing.web_l.material.getDensity);
index = index + 1;

%skin stringers
for s = wing.web_l.stringers
    mass_fn{index} = @(x)(x(index) * s.material.getDensity);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=-=-

% finally sum up these functions
final_fn = @(x) sum(cellfun(@(y) y(x), mass_fn));
end

