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
            
            %setup the stringer positions for a default wing
            obj.stringer1 = Stringer([-0.75, 0.08]);
            obj.stringer2 = Stringer([-0.40, 0.11]);
            obj.stringer3 = Stringer([0.35, 0.11]);
            obj.stringer4 = Stringer([0.75, 0.06]);
            obj.stringer5 = Stringer([0.75, -0.06]);
            obj.stringer6 = Stringer([0.35, -0.11]);
            obj.stringer7 = Stringer([-0.40, -0.11]);
            obj.stringer8 = Stringer([-0.75, -0.08]);
        end
        
    end
end

