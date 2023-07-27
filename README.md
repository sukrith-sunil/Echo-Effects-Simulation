<h1 align="center">Echo Effects Simulation: <br> Modeling Reverberation Characteristics using Digital Filters</h1>

<br>

## Overview

This research project investigates the simulation of environmental echo effects on audio signals by employing digital filters. The primary objective is to explore the impact of physical environments, mainly mountainous areas, on sound propagation and the creation of reverberation effects. The study focuses on the use of Finite Impulse Response (FIR) and Infinite Impulse Response (IIR) filters to accurately replicate the echoes produced when a person calls out in a mountain range.

The paper outlines the comprehensive filter design methodology, encompassing delay and attenuation calculations based on specific parameters related to mountainous environments. MATLAB is utilized to implement these filters, taking the "countdownfrom.mp3" speech file as the input for simulation. The obtained results are rigorously analyzed and compared against the original audio, successfully validating the presence of simulated echoes.

Moreover, a listening test is conducted to evaluate the fidelity and realism of the recreated environment. The outcomes of this study contribute significantly to a deeper understanding of audio signal processing mechanisms, offering valuable insights into the generation and perception of echoes in various physical settings.

<br>

## Key Objectives:

- Investigate the simulation of environmental echo effects on audio signals using digital filters.
  
- Explore the impact of mountainous environments on sound propagation and reverberation effects.
  
- Implement FIR and IIR filters for replicating echoes in MATLAB.

- Analyze and validate the simulated echoes against the original audio.

- Conduct a listening test to evaluate the fidelity and realism of the recreated environment.

- Extend the current knowledge of audio signal processing techniques for practical applications in acoustic design and immersive virtual 
  reality audio experiences.

- The findings of this research project hold significant implications for various fields, including audio signal processing, acoustics, 
  and virtual reality technologies, paving the way for improved audio design and realistic audio experiences in virtual environments.

<br>

## Abstract 

This research explores the simulation of environmental echo effects on audio signals using digital filters. The focus is on understanding the impact of mountainous areas on sound propagation and reverberation effects. The study employs Finite Impulse Response (FIR) and Infinite Impulse Response (IIR) filters to replicate echoes produced in mountain ranges. Specific parameters guide the filter design methodology, incorporating delay and attenuation calculations. MATLAB implements the filters, using "countdownfrom.mp3" as input. Results are rigorously analyzed and compared with the original audio to validate simulated echoes. A listening test assesses fidelity and realism. This research enhances our knowledge of audio signal processing, offering insights into echo generation and perception in various physical settings, with implications for acoustic design and immersive virtual reality audio experiences.

<br>

## Source Code

```
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

out = conv(x, h);                  % Applying the  filter
t = (0:length(x)-1) / fs;

figure;
subplot(2, 1, 1);
plot(t, x);                                 % Plot the input
xlabel('Time (s)');
ylabel('Amplitude');
title('Input Signal');

subplot(2,1,2)
plot(t, out(1:length(t)));              % Plot the output
xlabel('Time (s)');
ylabel('Amplitude');
title('Reverbed Signal (FIR)');


% Impuls Response

y2=[1 zeros(1,fs-1)];
t = (0:length(y2)-1) / fs;
y = conv(y2, h);
plot(t, y(1:length(t)));      % Plot Impuls Response
xlabel('Time (s)');
ylabel('Amplitude');
title('Impulse Response (FIR)');

%frequency response
B = h;
A= [1];
TF=tf(B,A);
freqz(B,A)                      % Plot Normalized Frequecy Response
figure
freqz(B,A,512,"whole",fs)

%Poles and zero
figure
pzmap(TF)                      % Plot Poles and Zeroes


% Save the output signal as a WAV file

audiowrite("output_signal.wav", out, fs);

```

<br>

For further information regarding the project refer to the `report/PROJECT REPORT.pdf`

<br>


## Acknowledgments

I would like to express our gratitude to _**Dr. A. Manikandan**_ for supervising and guiding this research project.
