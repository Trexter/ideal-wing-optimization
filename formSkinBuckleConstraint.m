function [c] = formSkinBuckleConstraint(wing, x, q_vec)
%tau = q/t

q_index = 1;
x_index = length(wing2DimensionVector(wing) - length(wing.web_l.stringers)); %thickness

skin = wing.web_l;

c = (abs(q_vec(q_index) / x(x_index)) - skin.tau_cr_per_thickness2 * x(x_index)^2);
q_index = q_index + 1;

x_index = 2;
% skin_tl
skin = wing.skin_tl;

for it = (1:(length(skin.stringers)+1))
    c = [c,(abs(q_vec(q_index) / x(x_index)) - skin.tau_cr_per_thickness2 * x(x_index)^2)];
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers); 
%-=-=-=-=-=-

% skin_tm
skin = wing.skin_tm;

for it = (1:(length(skin.stringers)+1))
    c = [c,(abs(q_vec(q_index) / x(x_index)) - skin.tau_cr_per_thickness2 * x(x_index)^2)];
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers); 
%-=-=-=-=-=-
% skin_tr
skin = wing.skin_tr;

for it = (1:(length(skin.stringers)+1))
    c = [c,(abs(q_vec(q_index) / x(x_index)) - skin.tau_cr_per_thickness2 * x(x_index)^2)];
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers); 
%-=-=-=-=-=-
% web_r
skin = wing.web_r;

for it = (1:(length(skin.stringers)+1))
    c = [c,(abs(q_vec(q_index) / x(x_index)) - skin.tau_cr_per_thickness2 * x(x_index)^2)];
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers); 
%-=-=-=-=-=-
% skin_br
skin = wing.skin_br;

for it = (1:(length(skin.stringers)+1))
    c = [c,(abs(q_vec(q_index) / x(x_index)) - skin.tau_cr_per_thickness2 * x(x_index)^2)];
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers); 
%-=-=-=-=-=-
% skin_bm
skin = wing.skin_bm;

for it = (1:(length(skin.stringers)+1))
    c = [c,(abs(q_vec(q_index) / x(x_index)) - skin.tau_cr_per_thickness2 * x(x_index)^2)];
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers); 
%-=-=-=-=-=-
% skin_bl
skin = wing.skin_bl;

for it = (1:(length(skin.stringers)+1))
    c = [c,(abs(q_vec(q_index) / x(x_index)) - skin.tau_cr_per_thickness2 * x(x_index)^2)];
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers); 
%-=-=-=-=-=-
% web_l
skin = wing.web_l;

for it = (1:(length(skin.stringers))) %if there are no stringers stop
    c = [c,(abs(q_vec(q_index) / x(x_index)) - skin.tau_cr_per_thickness2 * x(x_index)^2)];
    q_index = q_index + 1;
end

%x_index = x_index + 2 + length(skin.stringers); 
%-=-=-=-=-=-

assert(q_index-1 == length(q_vec))

end

