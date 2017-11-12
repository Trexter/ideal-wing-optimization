classdef Skin
    % there are 6 skins on our airfoil
    
    properties
        stringers; % empty by default should be created columnwise
        thickness; % m
        length; % m
        tau_cr_per_thickness2; % skin buckle tau critical per thickness^2
        material; 
    end
    
    methods
        function obj = Skin()
            obj.thickness = 0.01; % the default thickness
            obj.material = Material;
            
        end
        
        function taucr_pt2 = computeTauCriticalPerThickness2(obj)
            a_over_b = [1.0, 1.25, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3.0, 3.25, 3.5, 3.75, 4.0, 6.0, 11.0];
            K_vals = [15.5, 13, 12.15, 11.6, 11.25, 11, 10.75, 10.5, 10.3, 10.2, 10, 9.8, 9.75, 9, 9];
            
            % assume a = 1 !!!!!!
            a = 1;
            
            stringerCount = length(obj.stringers);
            
            K = interp1(a_over_b, K_vals, a/(obj.length/(stringerCount+1)))
            
            assert(~isnan(K))
            
            taucr_pt2 = K*pi^2/12 * obj.material.getYoungsModulus / (obj.length/(stringerCount+1))^2;
        end
    end
end

