function output = tcospuls(t)
% Plots a triangle pulse multiplied by a cosine wave.
% t - x-axis

output = tripuls(t,2).*cos((pi/2)*t);
end