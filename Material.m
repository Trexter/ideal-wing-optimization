classdef Material
    %This class describes the material 
    
    properties
        type=1 % an internal variable which acts as the index when looking up the material
        % materials: Al6061, 
        youngs_modulus_list = [68.9e9] % Pa
        yield_strength_list = [276e6] % Pa
        density_list = [2700] % kg/m^3
    end
    
    methods
        
        function obj = Material()
            
        end
        
        function E = getYoungsModulus(obj)
            E = obj.youngs_modulus_list(obj.type);
        end
        
        function rho = getDensity(obj)
            rho = obj.density_list(obj.type);
        end
        
        function sigma = getYieldStrength(obj)
            sigma = obj.yield_strength_list(obj.type)
        end
    end
end

