classdef Skin
    % there are 6 skins on our airfoil
    
    properties
        stringers;
        thickness; % m
        material; %
    end
    
    methods
        function obj = Skin()
            obj.thickness = 0.003; % the default thickness
            obj.material = Material;
        end
    end
end

