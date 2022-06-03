%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: Lab3
% Names: Alex Kaiser, Ryan Lenoir, Zach V
% Class: EGR 323
% Description: This lab included demonstrating properties 
% of systems both analytically and graphically
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


n = 0:1:10;                             %% point vector


%%%%%%%%%%%%%%%%%%%%%%%%% part a %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_1 = square(0.5*2*pi*n);               %% square wave input
y_1 = (1/3) .* x_1 + 3;
y_2 = y_1 .* 2;
y_3 = (1/3) .* (x_1 + x_1) + 3;

alpha = 2;

y_4 = ((1/3) * alpha .* x_1) + 3;
y_5 = y_1 .* alpha;


%%% plotting part a
figure(1);
subplot(2,1,1);
plot(n,y_2);
grid;
xlabel('Sample [n]')
ylabel('Pulse Amplitude')
title ('Plot A: Scalability Test')
ylim([2 10])
hold on
plot(n, y_3);
legend('y[n] * 2','y[n] with x[n] * 2','location',"best")
hold off

subplot(2,1,2);
plot(n,y_4);
grid;
xlabel('Sample [n]')
ylabel('Pulse Amplitude')
title ('Plot A: Additivity Test ')
ylim([2 10])
hold on
plot(n, y_5);
legend('y[n] with x[n] + x[n]','y[n] + y[n]','location',"best")
hold off


%%%%%%%%%%%%%%%%%%%%%%%%% part b %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n_1 = n - 1;
x_2 = cos(0.5*2*pi*n);                      %%%%%%%%%% cos input wave
x_3 = cos(0.5*2*pi*n_1);

y_7 = zeros(1, length(n));
y_8 = zeros(1, length(n_1));
k = 0:1:4;

%%%%%%%%%% sum k times at each point n %%%%%%%%%%%%%%%%%%%%
for i = 1:length(n)
    for j = 1:length(k)
        if i > k(j)
            y_7(i) = y_7(i) + ((1/4)^k(j) * (x_2(i - k(j))));
        else
            y_7(i) = y_7(i) + 0;
        end
    end
end

for i = 1:length(n_1)
    for j = 1:length(k)
        if i > k(j)
            y_8(i) = y_8(i) + ((1/4)^k(j) * (x_3(i - k(j))));
        else
            y_8(i) = y_8(i) + 0;
        end
    end
end


x_4 = y_7 - (1/4).*y_8;

%%% plotting part b
figure(2);
plot(n,x_2);
grid;
xlabel('Sample [n]')
ylabel('Pulse Amplitude')
title ('Plot B: Invertibility Test')
hold on 
plot(x_4);
legend('Original Input x[n]','Inverted Input','location',"northeast")
hold off

%%%%%%%%%%%%%%%%%%%%%%%%% part c %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3);
x_5 = sin(0.5*2*pi*n);                          %% sin input wave
n0 = 5;
x_5_n0 = sin(0.5*2*pi*(n- n0));

y_9 = (n - 15) .* x_5_n0;
y_10 = (n - n0 - 15) .* x_5_n0;

%%% plotting part c
plot(n,y_9);
hold on 
plot(n,y_10);
grid;
xlabel('Sample [n]')
ylabel('Pulse Amplitude')
title ('Plot C: Time Invariance Test')
legend('y[n]','y[n-n0]','location',"best")
hold off

%%%%%%%%%%%%%%%%%%%%%%%%% part e %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4);
n1 = 0:1:10;
x_6_u(n1 >= 0) = 1;

x_6 = (-1).^n1 .* x_6_u;                %% input signal

y_10 = zeros(1,length(n1));

for i = 1:length(n1)
       if i > 1
            y_10(i) = x_6(i) + (2 * y_10(i - 1)); 
       else
           y_10(i) = x_6(i);
       end
end

%%% plotting part e
plot(n1, y_10);
grid;
xlabel('Sample [n]')
ylabel('Pulse Amplitude')
title ('Plot E: BIBO Stability Test')






