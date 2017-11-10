function [new_wing] = dimensionVector2Wing(old_wing, dim_x)
%update a wing with optimized dimensions
new_wing = old_wing;

index = 1;

new_wing.stringer1.area = dim_x(index);
index = index + 1;

new_wing.skin_tl.thickness = dim_x(index);
index = index + 1;

for stringers_index = (1:1:length(new_wing.skin_tl.stringers))
    new_wing.skin_tl.stringers(stringers_index).area = dim_x(index);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=

new_wing.stringer2.area = dim_x(index);
index = index + 1;

new_wing.skin_tm.thickness = dim_x(index);
index = index + 1;

for stringers_index = (1:1:length(new_wing.skin_tm.stringers))
    new_wing.skin_tm.stringers(stringers_index).area = dim_x(index);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=

new_wing.stringer3.area = dim_x(index);
index = index + 1;

new_wing.skin_tr.thickness = dim_x(index);
index = index + 1;

for stringers_index = (1:1:length(new_wing.skin_tr.stringers))
    new_wing.skin_tr.stringers(stringers_index).area = dim_x(index);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=

new_wing.stringer4.area = dim_x(index);
index = index + 1;

new_wing.web_r.thickness = dim_x(index);
index = index + 1;

for stringers_index = (1:1:length(new_wing.web_r.stringers))
    new_wing.web_r.stringers(stringers_index).area = dim_x(index);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=

new_wing.stringer5.area = dim_x(index);
index = index + 1;

new_wing.skin_br.thickness = dim_x(index);
index = index + 1;

for stringers_index = (1:1:length(new_wing.skin_br.stringers))
    new_wing.skin_br.stringers(stringers_index).area = dim_x(index);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=

new_wing.stringer6.area = dim_x(index);
index = index + 1;

new_wing.skin_bm.thickness = dim_x(index);
index = index + 1;

for stringers_index = (1:1:length(new_wing.skin_bm.stringers))
    new_wing.skin_bm.stringers(stringers_index).area = dim_x(index);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=

new_wing.stringer7.area = dim_x(index);
index = index + 1;

new_wing.skin_bl.thickness = dim_x(index);
index = index + 1;

for stringers_index = (1:1:length(new_wing.skin_bl.stringers))
    new_wing.skin_bl.stringers(stringers_index).area = dim_x(index);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=

new_wing.stringer8.area = dim_x(index);
index = index + 1;

new_wing.web_l.thickness = dim_x(index);
index = index + 1;

for stringers_index = (1:1:length(new_wing.web_l.stringers))
    new_wing.web_l.stringers(stringers_index).area = dim_x(index);
    index = index + 1;
end

%-=-=-=-=-=-=-=-=

end

