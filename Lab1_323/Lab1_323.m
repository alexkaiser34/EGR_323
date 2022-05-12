%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: Lab1
% Names: Alex Kaiser, Ryan Lenoir, Zach V
% Class: EGR 323
% Description: This lab has 3 parts. The first part plots three different
% functions to practice MATLAB syntax. The second part involves creating a
% function that returns data for a triangle-weighted cosine pulse plot.
% The last part is using this function to gather data for subplots 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = linspace(-2,2,1000);
u = zeros(1,length(t));
u1 = zeros(1,length(t));
u2 = zeros(1,length(t));

u(t >= 0) = 1;
u1 = u .* t;
u2(t >= -0.75 & t <= 0.75) = 1;
figure(1);
plot(t,u);
hold on
plot(t,u1);
hold on
plot(t,u2);
title("Part 1 Lab 1");
xlabel("Time (s)");
ylabel("Amplitude");
legend("u(t)", "u(t)*t", "u(t+0.75)-u(t-0.75)", "Location", "northwest");
hold off

%%%%%%%%%%%%%%%%%%%%%%%%% Part 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = linspace(-1,1,1000);
puls = tcospuls(t);
figure(2);
plot(t, puls);
title("Part 2 Lab 1");
xlabel("Time (s)");
ylabel("Pulse Amplitude");

%%%%%%%%%%%%%%%%%%%%%%%%% Part 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = linspace(-10,10,1000);
t1 = (-t - 2) / 4;
t2 = (t - 6) /4;
t3 = (2 * t) + 4;
t4 = (2 * t) - 4;
t5 = (t + 1) / 4;
t6 = (t - 1) / 4;

g_a = tcospuls(t);

g_b(1, :) = tcospuls(t1);
g_b(2, :) = tcospuls(t2);
g_b(3, :) = (-1 * g_b(1, :)) + g_b(2, :);

g_c(1,:) = tcospuls(t3);
g_c(2,:) = tcospuls(t4);
g_c(3,:) = (1/5) * (g_c(1,:) + g_c(2,:));

g_d(1,:) = tcospuls(t5);
g_d(2,:) = tcospuls(t6);
g_d(3,:) = g_d(1,:) .* g_d(2,:);

figure(3);
subplot(2,2,1);
plot(t, g_a);
title("Part 3 Question a");
xlabel("Time (s)");
ylabel("Amplitude");

subplot(2,2,2);
plot (t, g_b(3,:));
title("Part 3 Question b");
xlabel("Time (s)");
ylabel("Amplitude");

subplot(2,2,3);
plot (t, g_c(3,:));
title("Part 3 Question c");
xlabel("Time (s)");
ylabel("Amplitude");

subplot(2,2,4);
plot (t, g_d(3,:));
title("Part 3 Question d");
xlabel("Time (s)");
ylabel("Amplitude");

