clear all;
[signal,Fs]=audioread('audio2.wav');
info=audioinfo('audio2.wav');
mu=input("enter the mu value");% signal x is 16-bit
normalisied_signal = signal/max(signal);
compressed_signal=sign(signal).*((log(1+mu*abs(normalisied_signal)))/log(abs(1+mu)) );
signal8bit =sign(signal).*floor(127*compressed_signal);
% TRANSMIT
normalisied_8bitsignal = signal8bit/max(signal8bit);
expanded_signal = sign(signal).*((((mu+1).^abs(normalisied_8bitsignal))-1)/mu);
% scale to 16 bits:
signal_16bit= ceil((2^15).*expanded_signal);
output_signal = signal_16bit/max(signal_16bit);
%MSE
MSE = (sum((signal-output_signal).^2,'all'))/length(signal);
quanterror=signal-signal8bit;
SQNR_ip = -20*log10( sqrt(mean(signal.^2))/sqrt(mean(quanterror.^2)) );
quanterror1=signal8bit-signal_16bit;
SQNR_op = -20*log10( sqrt(mean(signal8bit.^2))/sqrt(mean(quanterror1.^2)) );
subplot(311)
plot(signal)
title("Input Audio Signal");
subplot(312)
plot(compressed_signal)
title("PCM Output");
subplot(313)
plot(output_signal)
title("Output Audio Signal");
