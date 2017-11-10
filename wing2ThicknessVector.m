function [x] = wing2ThicknessVector(wing)
%turn a general wing into a ordered thickness vector

index = 1;

x(index) = wing.stringer1.area;
index = index + 1;

x(index) = wing.skin_tl.thickness;
index = index + 1;

for s = wing.skin_tl.stringers
    x(index) = s.area;
    index = index + 1;
end

%-=-=-=-=-=-=-

x(index) = wing.stringer2.area;
index = index + 1;

x(index) = wing.skin_tm.thickness;
index = index + 1;

for s = wing.skin_tm.stringers
    x(index) = s.area;
    index = index + 1;
end

%-=-=-=-=-=-=-

x(index) = wing.stringer3.area;
index = index + 1;

x(index) = wing.skin_tr.thickness;
index = index + 1;

for s = wing.skin_tr.stringers
    x(index) = s.area;
    index = index + 1;
end

%-=-=-=-=-=-=-

x(index) = wing.stringer4.area;
index = index + 1;

x(index) = wing.web_r.thickness;
index = index + 1;

for s = wing.web_r.stringers
    x(index) = s.area;
    index = index + 1;
end

%-=-=-=-=-=-=-

x(index) = wing.stringer5.area;
index = index + 1;

x(index) = wing.skin_br.thickness;
index = index + 1;

for s = wing.skin_br.stringers
    x(index) = s.area;
    index = index + 1;
end

%-=-=-=-=-=-=-

x(index) = wing.stringer6.area;
index = index + 1;

x(index) = wing.skin_bm.thickness;
index = index + 1;

for s = wing.skin_bm.stringers
    x(index) = s.area;
    index = index + 1;
end

%-=-=-=-=-=-=-

x(index) = wing.stringer7.area;
index = index + 1;

x(index) = wing.skin_bl.thickness;
index = index + 1;

for s = wing.skin_bl.stringers
    x(index) = s.area;
    index = index + 1;
end

%-=-=-=-=-=-=-

x(index) = wing.stringer8.area;
index = index + 1;

x(index) = wing.web_l.thickness;
index = index + 1;

for s = wing.web_l.stringers
    x(index) = s.area;
    index = index + 1;
end

end

