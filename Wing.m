classdef Wing
    % this is the definition of a wing
    
    properties
        skin_tl; % the top left skin
        skin_tm; % the top left skin
        skin_tr; % the top left skin
        skin_br; % the top left skin
        skin_bm; % the top left skin
        skin_bl; % the top left skin
        web_configuration;
    end
    
    methods
        
        function[obj] = Wing()
            obj.skin_tl = Skin;
            obj.skin_tm = Skin;
            obj.skin_tr = Skin;
            obj.skin_br = Skin;
            obj.skin_bm = Skin;
            obj.skin_bl = Skin;
        end
        
    end
end

