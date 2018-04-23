function [total_power] = reflexion_1(tx_x,tx_y,rx_x,rx_y, xdim,ydim,GTX,PTX,beta)

total_power = 0;
reflexion_coeff = 1;

% REFLEXIONS ON X_WALLS

wall_x = tx_x;

for wall_y = 0:ydim:ydim
    image_tx_x = wall_x;
    wall_distance = abs(wall_y-tx_y);
    if (wall_y==0)
        image_tx_y = -wall_distance;
    elseif (wall_y==ydim)
        image_tx_y = ydim+wall_distance;
    end
    distance_imgrxtx = sqrt((image_tx_x-rx_x)^2 + (image_tx_y-rx_y)^2);
    total_power = total_power + (abs(reflexion_coeff*sqrt(60*GTX*PTX)*(exp(-j*beta*distance_imgrxtx))/distance_imgrxtx)^2)/(2*120*pi);
end

% REFLEXIONS ON Y_WALLS

wall_y = tx_y;

for wall_x = 0:xdim:xdim
    image_tx_y = wall_y;
    wall_distance = abs(wall_x-tx_x);
    if (wall_x==0)
        image_tx_x = -wall_distance;
    elseif (wall_x==xdim)
        image_tx_x = xdim+wall_distance;
    end
    distance_imgrxtx = sqrt((image_tx_x-rx_x)^2 + (image_tx_y-rx_y)^2);
    total_power = total_power + (abs(reflexion_coeff*sqrt(60*GTX*PTX)*(exp(-j*beta*distance_imgrxtx))/distance_imgrxtx)^2)/(2*120*pi);
end