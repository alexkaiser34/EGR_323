function [puls] = tcospuls(time)
    puls = tripuls(time, 2) .* cos((pi / 2) * time);
end

%  puls = tripuls(time,time(length(time)) - time(1)) .* cos((pi/2)*time);
