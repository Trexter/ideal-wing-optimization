classdef Material
    %This class describes the material 
    
    properties
        type=1 % an internal variable which acts as the index when looking up the material
        % materials: Al6061, Al7075, Al5052, Al2024, Ti6Al4V
        youngs_modulus_list = [68.9e9, 71.7e9, 70.3e9, 73.1e9, 113.8e9] % Pa
        yield_strength_list = [276e6, 503e6, 214e6, 324e6, 880e6] % Pa
        density_list = [2700, 2810, 2680, 2780, 4430] % kg/m^3
        shear_modulus_list = [26e9, 26.9e9, 25.9e9, 28e9, 44e9] %Pa
    end
    
    methods
        
        function obj = Material()
            obj.type = 5; % set a default material
        end
        
        function E = getYoungsModulus(obj)
            E = obj.youngs_modulus_list(obj.type);
        end
        
        function rho = getDensity(obj)
            rho = obj.density_list(obj.type);
        end
        
        function sigma = getYieldStrength(obj)
            sigma = obj.yield_strength_list(obj.type);
        end
        
        function G = getShearModulus(obj)
            G = obj.shear_modulus_list(obj.type);
        end
    end
end

