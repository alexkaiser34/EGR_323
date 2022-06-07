%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: Lab4
% Names: Alex Kaiser, Ryan Lenoir, Zach V
% Class: EGR 323
% Description: This part involved plotting the transfer function when
% the input was the delta function.  The conv MATLAB command was used
% to plot the convolution of a specific input and transfer function.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = -20:1:20;           %% n vector

u(n >= 0) = 1;          %% step function
u_1(n >= 2) = 1;
u_2(n >= 12) = 1;
x_n = u_1 - u_2;        %% input function

y_n = (1/3).^n .* u;    %% impulse response, y[n] = h[n]
plot(n, y_n);
hold on

result = conv(x_n,y_n, "same");     %% convolution result
plot(n, result);
hold off

%%%% Formatting plot nicely %%%%%
title("Impulse Response and Convolution Result");
ylim([-1 2]);
xlim([-10 20]);
grid();
xlabel("n");
ylabel("y[n]");
legend("impulse response", "Convolution Result",...
    "location", "northwest");

