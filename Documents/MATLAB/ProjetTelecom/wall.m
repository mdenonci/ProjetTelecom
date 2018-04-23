classdef wall
    properties
        relative_perm;
        conductivity;
        permittivity;
        thickness;
        x_pos;
        y_pos;
    end
    methods
        function obj = wall(t,x,y,eps_r,sigma,eps_0,omega)
            obj.thickness = t;
            obj.x_pos = x;
            obj.y_pos = y;
            obj.relative_perm = eps_r;
            obj.conductivity = sigma;
            obj.permittivity = eps_0-(i*sigma/omega);
        end
    end
end
