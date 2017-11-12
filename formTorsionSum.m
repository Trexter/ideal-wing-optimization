function [q0_fn] = formTorsionSum(wing, x, q_vec)
%solve for q0 using torsion eqn

total_area = 0.2995 %m^2

q_index = 1;
wing_dim = length(wing2DimensionVector(wing));
x_index = wing_dim - length(wing.web_r.stringers); % need to start at the web_r thickness

% starting a web_l's top most section

skin = wing.web_l;

q0_fn = (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
q_index = q_index + 1;

% skin_tl

skin = wing.skin_tl;

x_index = 2; % skip the stringer

q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
q_index = q_index + 1;

%cycle through each stringer 
for it = skin.stringers
    q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers);

%-=-=-=-=-=-=-=-
% skin_tm

skin = wing.skin_tm;

q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
q_index = q_index + 1;

%cycle through each stringer 
for it = skin.stringers
    q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers);

%-=-=-=-=-=-=-=-
% skin_tr

skin = wing.skin_tr;

q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
q_index = q_index + 1;

%cycle through each stringer 
for it = skin.stringers
    q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers);

%-=-=-=-=-=-=-=-
% skin_web_r

skin = wing.web_r;

q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
q_index = q_index + 1;

%cycle through each stringer 
for it = skin.stringers
    q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers);

%-=-=-=-=-=-=-=-
% skin_br

skin = wing.skin_br;

q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
q_index = q_index + 1;

%cycle through each stringer 
for it = skin.stringers
    q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers);

%-=-=-=-=-=-=-=-
% skin_bm

skin = wing.skin_bm;

q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
q_index = q_index + 1;

%cycle through each stringer 
for it = skin.stringers
    q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers);

%-=-=-=-=-=-=-=-
% skin_bl

skin = wing.skin_bl;

q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
q_index = q_index + 1;

%cycle through each stringer 
for it = skin.stringers
    q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
    q_index = q_index + 1;
end

x_index = x_index + 2 + length(skin.stringers);

%-=-=-=-=-=-=-=-
% skin_web_l

q_index = q_index - 1; % typically there are no more q's

skin = wing.web_l;

if(~isempty(skin.stringers))
    q_index = q_index + 1;
    q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
    q_index = q_index + 1;
end

%cycle through each stringer 
for it = (1:length(skin.stringers)-1)
    q0_fn = q0_fn + (skin.length / (1 + length(skin.stringers))) * q_vec(q_index) / (skin.material.getShearModulus * x(x_index))
    q_index = q_index + 1;
end

%x_index = x_index + 2 + length(skin.stringers);

%-=-=-=-=-=-=-=-

disp(q_index)
disp(length(q_vec))
assert(q_index == length(q_vec))

q0_fn = (1/(2*total_area)) * q0_fn;

end

