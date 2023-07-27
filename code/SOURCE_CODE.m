% FIR  Filter

clear var
close all
clc

% Read audio signal

[x,fs] = audioread("countdown.mp3"); 

% Define the parameters
Td = 0.1;                         % time delay in seconds
Nd = round(fs * Td);       % Delay length in samples
G = 0.7;                          % Feedback gain


% Generate the impulse response
n=1:10;
h=[1 zeros(1,10*Nd -1)];
h(n.*Nd)=G.^n;





% Plot the input and output signals

y = conv(x, h);                  % Applying the  filter
t = (0:length(x)-1) / fs;

figure;
subplot(2, 1, 1);
plot(t, x);                                 % Plot the input
xlabel('Time (s)');
ylabel('Amplitude');
title('Input Signal');

subplot(2,1,2)
plot(t, y(1:length(t)));              % Plot the output
xlabel('Time (s)');
ylabel('Amplitude');
title('Reverbed Signal (FIR)');


% Impuls Response

y2=[1 zeros(1,fs-1)];
t = (0:length(y2)-1) / fs;
y = conv(y2, h);
plot(t, y(1:length(t)));
xlabel('Time (s)');
ylabel('Amplitude');
title('Impulse Response (FIR)');

%frequency response
B = h;
A= [1];
TF=tf(B,A);
freqz(B,A)
figure
freqz(B,A,512,"whole",fs)

%Poles and zero
figure
pzmap(TF)

