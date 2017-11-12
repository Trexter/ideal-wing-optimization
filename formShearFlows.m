function [q_vec] = formShearFlows(q0, dp_vec)

% this is a fully symbolic function

q_vec = q0;

for index = (1:length(dp_vec))
    
   q_vec(index+1) = q_vec(index) - dp_vec(index);
    
end

end

