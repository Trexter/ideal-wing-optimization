classdef Stringer
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        area; % m^2
        position; %[m, m]
        material;
    end
    
    methods
        
        function [obj] = Stringer(pos)
            assert(length(pos) == 2);
            obj.position = pos;
            
            obj.area = 0.001;
            
            obj.material = Material;
            
        end
        
    end
end

