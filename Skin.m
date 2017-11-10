classdef Skin
    % there are 6 skins on our airfoil
    
    properties
        stringers;
        thickness; % m^2
        material; %
    end
    
    methods
        function obj = Skin()
            obj.thickness = 0.01;
            obj.material = Material;
        end
    end
end

