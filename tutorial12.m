%% EE241 Spring 2015, Tutorial 12, Apr. 17
% Let's generate a signal that consists of a sine wave with some noise
% added. Let's also plot this signal.
N=2^10;
t = 1:0.01*pi:N*0.01*pi;
a = 10;
b = 0.4*pi;
s = 0.5;
signal = sin(t+b) + normrnd(0,s,1,numel(t));

figure(1)
plot(t,signal);
title('Input signal $$x(t)$$ in the time basis','interpreter','latex');
xlabel('time $$t$$','interpreter','latex');
ylabel('signal $$x(t)$$','interpreter','latex');

%%
% Let's transform the signal to the Haar basis and plot it there. First, we
% must pad the signal with some 0's so that the Haar matrix can be applied
% (Haar matrices only come in dimensions that are powers of 2).
N = 2^nextpow2(numel(signal));
signal(N) = 0;
H = generate_haar(N);
Hsignal = (H*signal')';

figure(2)
plot(1:N, Hsignal);
title('Input signal $$x(\theta)$$ in the Haar basis','interpreter','latex');
xlabel('Haar coefficient $$\theta$$','interpreter','latex');
ylabel('signal $$x(t)$$','interpreter','latex');

%%
% Now let's drop everything after the first 50 terms in the Haar basis then
% transform back into the time basis and plot that, you should notice that
% the new signal does not have "high-frequency" components. You can play
% around with the LOWPASS variable below
LOWPASS = 10;
Hsignal(LOWPASS:end) = 0;
t = 1:0.01*pi:N*0.02*pi;
signal = (H\Hsignal')';
t(numel(signal)+1:end)=[];

figure(3)
plot(t, signal);
title('Output signal $$x(t)$$ after low-pass','interpreter','latex');
xlabel('time $$t$$','interpreter','latex');
ylabel('signal $$x(t)$$','interpreter','latex');