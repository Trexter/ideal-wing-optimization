classdef Wing
    % this is the definition of a wing
    % the coordinate frame origin is defined as the center of the wing
    
    properties
        stringer1; % this stringer is the stringer on top of the far left web
        skin_tl; % the top left skin
        stringer2; % the stringers continue clockwise after the first with skin and skin stringers between 
        skin_tm; % the top left skin
        stringer3;
        skin_tr; % the top left skin
        stringer4;
        web_r; % the right web
        stringer5;
        skin_br; % the top left skin
        stringer6;
        skin_bm; % the top left skin
        stringer7;
        skin_bl; % the top left skin
        stringer8;
        web_l; % the left web
        
    end
    
    methods
        
        function[obj] = Wing()
            obj.skin_tl = Skin;
            obj.skin_tm = Skin;
            obj.skin_tr = Skin;
            obj.skin_br = Skin;
            obj.skin_bm = Skin;
            obj.skin_bl = Skin;
            
            obj.web_l = Skin;
            obj.web_r = Skin;
            
            %setup the stringer positions and skin lengths for a default wing 
            obj.stringer1 = Stringer([-0.75, 0.08]);
            obj.stringer2 = Stringer([-0.40, 0.11]);
            obj.skin_tl.length = norm(obj.stringer2.position - obj.stringer1.position);
            obj.skin_tl.tau_cr_per_thickness2  = obj.skin_tl.computeTauCriticalPerThickness2();
            obj.stringer3 = Stringer([0.35, 0.11]);
            obj.skin_tm.length = norm(obj.stringer3.position - obj.stringer2.position);
            obj.skin_tm.tau_cr_per_thickness2  = obj.skin_tm.computeTauCriticalPerThickness2();
            obj.stringer4 = Stringer([0.75, 0.06]);
            obj.skin_tr.length = norm(obj.stringer4.position - obj.stringer3.position);
            obj.skin_tr.tau_cr_per_thickness2  = obj.skin_tr.computeTauCriticalPerThickness2();
            obj.stringer5 = Stringer([0.75, -0.06]);
            obj.web_r.length = norm(obj.stringer5.position - obj.stringer4.position);
            obj.web_r.tau_cr_per_thickness2  = obj.web_r.computeTauCriticalPerThickness2();
            obj.stringer6 = Stringer([0.35, -0.11]);
            obj.skin_br.length = norm(obj.stringer6.position - obj.stringer5.position);
            obj.skin_br.tau_cr_per_thickness2  = obj.skin_br.computeTauCriticalPerThickness2();
            obj.stringer7 = Stringer([-0.40, -0.11]);
            obj.skin_bm.length = norm(obj.stringer7.position - obj.stringer6.position);
            obj.skin_bm.tau_cr_per_thickness2  = obj.skin_bm.computeTauCriticalPerThickness2();
            obj.stringer8 = Stringer([-0.75, -0.08]);
            obj.skin_bl.length = norm(obj.stringer8.position - obj.stringer7.position);
            obj.skin_bl.tau_cr_per_thickness2  = obj.skin_bl.computeTauCriticalPerThickness2();
            
            obj.web_l.length = norm(obj.stringer1.position - obj.stringer8.position);
            obj.web_l.tau_cr_per_thickness2  = obj.web_l.computeTauCriticalPerThickness2()
        end
        
    end
end

