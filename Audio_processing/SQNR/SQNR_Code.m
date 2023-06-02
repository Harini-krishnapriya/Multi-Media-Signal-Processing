%Signal to Quantization Noise Ratio
clear all;
[audio_signal sampling_frequency]=audioread("happy.mp3");
b=input("enter the no of bits required to quantize");
quantizied_signal=round((2^(b-1)).*audio_signal)/2^(b-1);
quant_error= audio_signal-quantizied_signal;
sqnr= 20*log10(sqrt(mean(audio_signal.^2))/sqrt(mean(quant_error.^2)));
disp(sqnr);
subplot(311)
plot(audio_signal)
subplot(312)
plot(quantizied_signal)
subplot(313)
plot(quant_error)
