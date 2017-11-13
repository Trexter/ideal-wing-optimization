function [mom_fn] = formMomentSum(wing, q_vec)

% all with respect to stringer1
start_pos = wing.stringer1.position;

mom_fn = 0;

%web l and skin_tl have no effect

q_index = 2 + (1+length(wing.skin_tl.stringers)); % skip over q0 and all skin_tl

%handle skin_tm
pos2 = wing.stringer2.position;

for s = wing.skin_tm.stringers
    pos3 = s.position;
    area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
    mom_fn = mom_fn + 2 * q_vec(q_index) * area;
    q_index = q_index + 1;
    pos2 = pos3;
end

pos3 = wing.stringer3.position;
area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
mom_fn = mom_fn + 2 * q_vec(q_index) * area;
q_index = q_index + 1;
%-=-=-=-=-=-=-=-

%handle skin_tr
pos2 = wing.stringer3.position;

for s = wing.skin_tr.stringers
    pos3 = s.position;
    area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
    mom_fn = mom_fn + 2 * q_vec(q_index) * area;
    q_index = q_index + 1;
    pos2 = pos3;
end

pos3 = wing.stringer4.position;
area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
mom_fn = mom_fn + 2 * q_vec(q_index) * area;
q_index = q_index + 1;
%-=-=-=-=-=-=-=-

%handle web_r
pos2 = wing.stringer4.position;

for s = wing.web_r.stringers
    pos3 = s.position;
    area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
    mom_fn = mom_fn + 2 * q_vec(q_index) * area;
    q_index = q_index + 1;
    pos2 = pos3;
end

pos3 = wing.stringer5.position;
area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
mom_fn = mom_fn + 2 * q_vec(q_index) * area;
q_index = q_index + 1;
%-=-=-=-=-=-=-=-

%handle skin_br
pos2 = wing.stringer5.position;

for s = wing.skin_br.stringers
    pos3 = s.position;
    area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
    mom_fn = mom_fn + 2 * q_vec(q_index) * area;
    q_index = q_index + 1;
    pos2 = pos3;
end

pos3 = wing.stringer6.position;
area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
mom_fn = mom_fn + 2 * q_vec(q_index) * area;
q_index = q_index + 1;
%-=-=-=-=-=-=-=-

%handle skin_bm
pos2 = wing.stringer6.position;

for s = wing.skin_bm.stringers
    pos3 = s.position;
    area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
    mom_fn = mom_fn + 2 * q_vec(q_index) * area;
    q_index = q_index + 1;
    pos2 = pos3;
end

pos3 = wing.stringer7.position;
area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
mom_fn = mom_fn + 2 * q_vec(q_index) * area;
q_index = q_index + 1;
%-=-=-=-=-=-=-=-

%handle skin_bl
pos2 = wing.stringer7.position;

for s = wing.skin_bl.stringers
    pos3 = s.position;
    area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
    mom_fn = mom_fn + 2 * q_vec(q_index) * area;
    q_index = q_index + 1;
    pos2 = pos3;
end

pos3 = wing.stringer8.position;
area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
mom_fn = mom_fn + 2 * q_vec(q_index) * area;
q_index = q_index + 1;
%-=-=-=-=-=-=-=-

%handle web_l
pos2 = wing.stringer8.position;

for it = (1:(length(wing.skin_br.stringers)-1))
    pos3 = s.position;
    area = polyarea([start_pos(1), pos2(1), pos3(1)], [start_pos(2), pos2(2), pos3(2)])
    mom_fn = mom_fn + 2 * q_vec(q_index) * area;
    q_index = q_index + 1;
    pos2 = pos3;
end

assert(q_index - 1 == length(q_vec))

%-=-=-=-=-=-=-=-