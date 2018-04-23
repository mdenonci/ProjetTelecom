function [total_power] = reflexion_1_on_ind_walls(tx_x,tx_y,rx_x,rx_y,wall_x,wall_y,GTX,PTX,beta)

total_power = 0;
reflexion_coeff = 1;
x_distancerx = abs(wall_x-rx_x);
y_distancerx = abs(wall_y-rx_y);

if(tx_x < wall_x && tx_y < wall_y)
    hor_image_tx_y = tx_y;
    ver_image_tx_x = tx_x;
    
    x_distancetx = abs(wall_x-tx_x);
    y_distancetx = abs(wall_y-tx_y);
    
    hor_image_tx_x = wall_x+x_distancetx;
    ver_image_tx_y = wall_y+y_distancetx;
    if (atan(y_distancetx/x_distancetx) == atan(y_distancerx/x_distancerx))
        if(rx_x > wall_x && rx_y < wall_y)
            distance_imgrxtx = sqrt((ver_image_tx_x-rx_x)^2 + (ver_image_tx_y-rx_y)^2);
            total_power = total_power + (abs(reflexion_coeff*sqrt(60*GTX*PTX)*(exp(-j*beta*distance_imgrxtx))/distance_imgrxtx)^2)/(2*120*pi);
        elseif(rx_x < wall_x && rx_y > wall_y)
            distance_imgrxtx = sqrt((hor_image_tx_x-rx_x)^2 + (hor_image_tx_y-rx_y)^2);
            total_power = total_power + (abs(reflexion_coeff*sqrt(60*GTX*PTX)*(exp(-j*beta*distance_imgrxtx))/distance_imgrxtx)^2)/(2*120*pi);
        end
    end
elseif(tx_x > wall_x && tx_y < wall_y)
    hor_image_tx_y = tx_y;
    ver_image_tx_x = tx_x;
    
    x_distancetx = abs(wall_x-tx_x);
    y_distancetx = abs(wall_y-tx_y);
    
    hor_image_tx_x = wall_x+x_distancetx;
    ver_image_tx_y = wall_y+y_distancetx;
    if (atan(y_distancetx/x_distancetx) == atan(y_distancerx/x_distancerx))
        if(rx_x < wall_x && rx_y < wall_y)
            distance_imgrxtx = sqrt((ver_image_tx_x-rx_x)^2 + (ver_image_tx_y-rx_y)^2);
            total_power = total_power + (abs(reflexion_coeff*sqrt(60*GTX*PTX)*(exp(-j*beta*distance_imgrxtx))/distance_imgrxtx)^2)/(2*120*pi);
        elseif(rx_x > wall_x && rx_y > wall_y)
            distance_imgrxtx = sqrt((hor_image_tx_x-rx_x)^2 + (hor_image_tx_y-rx_y)^2);
            total_power = total_power + (abs(reflexion_coeff*sqrt(60*GTX*PTX)*(exp(-j*beta*distance_imgrxtx))/distance_imgrxtx)^2)/(2*120*pi);
        end
    end
elseif(tx_x < wall_x && tx_y > wall_y)
    hor_image_tx_y = tx_y;
    ver_image_tx_x = tx_x;
    
    x_distancetx = abs(wall_x-tx_x);
    y_distancetx = abs(wall_y-tx_y);
    
    hor_image_tx_x = wall_x+x_distancetx;
    ver_image_tx_y = wall_y+y_distancetx;
    if (atan(y_distancetx/x_distancetx) == atan(y_distancerx/x_distancerx))
        if(rx_x > wall_x && rx_y > wall_y)
            distance_imgrxtx = sqrt((ver_image_tx_x-rx_x)^2 + (ver_image_tx_y-rx_y)^2);
            total_power = total_power + (abs(reflexion_coeff*sqrt(60*GTX*PTX)*(exp(-j*beta*distance_imgrxtx))/distance_imgrxtx)^2)/(2*120*pi);
        elseif(rx_x < wall_x && rx_y < wall_y)
            distance_imgrxtx = sqrt((hor_image_tx_x-rx_x)^2 + (hor_image_tx_y-rx_y)^2);
            total_power = total_power + (abs(reflexion_coeff*sqrt(60*GTX*PTX)*(exp(-j*beta*distance_imgrxtx))/distance_imgrxtx)^2)/(2*120*pi);
        end
    end
elseif(tx_x > wall_x && tx_y > wall_y)
    hor_image_tx_y = tx_y;
    ver_image_tx_x = tx_x;
    
    x_distancetx = abs(wall_x-tx_x);
    y_distancetx = abs(wall_y-tx_y);
    
    hor_image_tx_x = wall_x+x_distancetx;
    ver_image_tx_y = wall_y+y_distancetx;
    if (atan(y_distancetx/x_distancetx) == atan(y_distancerx/x_distancerx))
        if(rx_x < wall_x && rx_y > wall_y)
            distance_imgrxtx = sqrt((ver_image_tx_x-rx_x)^2 + (ver_image_tx_y-rx_y)^2);
            total_power = total_power + (abs(reflexion_coeff*sqrt(60*GTX*PTX)*(exp(-j*beta*distance_imgrxtx))/distance_imgrxtx)^2)/(2*120*pi);
        elseif(rx_x > wall_x && rx_y < wall_y)
            distance_imgrxtx = sqrt((hor_image_tx_x-rx_x)^2 + (hor_image_tx_y-rx_y)^2);
            total_power = total_power + (abs(reflexion_coeff*sqrt(60*GTX*PTX)*(exp(-j*beta*distance_imgrxtx))/distance_imgrxtx)^2)/(2*120*pi);
        end
    end
end
end
   
    
%     
%     if (tx_y < wall_y)
%         image_tx_y = wall_y + wall_y-tx_y;
%     else
%         image_tx_y = wall_y - (tx_y-wall_y);
%     end
%     distance_imgrxtx = sqrt((image_tx_x-rx_x)^2 + (image_tx_y-rx_y)^2);
%     total_power = total_power + (abs(reflexion_coeff*sqrt(60*GTX*PTX)*(exp(-j*beta*distance_imgrxtx))/distance_imgrxtx)^2)/(2*120*pi);
% elseif(tx_y == wall_y)
%     %Ne marche que sur les murs à droite ...
%     image_tx_y = tx_y;
%     if (tx_x < wall_x)
%         image_tx_x = wall_x + wall_x-tx_x;
%     else
%         image_tx_x = wall_x - (tx_x-wall_x);
%     end
%     if rx_x < wall_x
%         distance_imgrxtx = sqrt((image_tx_x-rx_x)^2 + (image_tx_y-rx_y)^2);
%         total_power = total_power + (abs(reflexion_coeff*sqrt(60*GTX*PTX)*(exp(-j*beta*distance_imgrxtx))/distance_imgrxtx)^2)/(2*120*pi);
%     else
%         total_power = 0;
%     end