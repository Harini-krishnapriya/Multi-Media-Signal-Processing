%Denosing audio signal
Window_length= input("enter the window length");
[audio_signal sampling_frequency]=audioread("happy.mp3");
nosiy_audio=awgn(audio_signal,30);
W=floor(Window_length/2);
noisy_audio_channel1=[zeros(W,1); nosiy_audio(:,1); zeros(W,1)];  % Zero Padding
noisy_audio_channel2=[zeros(W,1); nosiy_audio(:,2); zeros(W,1)];
filter= input("enter the window");
filtered_signal_channel1=mean_filter(noisy_audio_channel1,W);   % Mean Filter
filtered_signal_chaneel2=mean_filter(noisy_audio_channel2,W);
% filtered_signal_channel1=median_filter(noisy_audio_channel1,W);  %Median filter
% filtered_signal_chaneel2=median_filter(noisy_audio_channel2,W);
% filtered_signal_channel1=weighted_average_filter(noisy_audio_channel1,filter); % Weighted average filter
% filtered_signal_chaneel2=weighted_average_filter(noisy_audio_channel2,filter);
filtered_audio_signal = [(filtered_signal_channel1)' (filtered_signal_chaneel2)'];
subplot(311)
plot(audio_signal);
title("Original audio signal");
subplot(312)
plot(nosiy_audio);
title("Nosiy audio siqnal");
subplot(313)
plot(filtered_audio_signal);
title("Filtered audio signal");
Mean_Square_error= (sum((audio_signal-filtered_audio_signal).^2,'all'))/length(audio_signal);
disp(Mean_Square_error)
% Note: for Mean and Median filter enter the window as 1 or any thing
% For weighted average filter pass the filter instead of filter lenght as in mean and median

function out = mean_filter(audio,window_slice)    % Mean Filter
    for i=1+window_slice:length(audio)-window_slice
        result=0;
        for j=-window_slice:1:window_slice
            result=result+audio(j+i);
        end
        filtered_signal(i-window_slice)=result;
    end
    out = filtered_signal;
end

function out = median_filter(audio,window_slice)   %Median Filter
    for i=1+window_slice:length(audio)-window_slice
        k=1;
        for j=-window_slice:1:window_slice
            result(k)=audio(j+i);
            k=k+1;
        end
        filtered_signal(i-window_slice)=median(result);
    end
    out = filtered_signal;
end

function out =weighted_average_filter(audio,window)        %Weighted Average Filter
       window_slice=floor(length(window)/2);
   for i=1+window_slice:length(audio)-window_slice
       result=0;
       index=1;
       for j=-window_slice:window_slice
           result=result+audio(i+j)*window(index);
           index=index+1;
       end
       filtered_signal(i-window_slice)=result/sum(window);
   end
       out = filtered_signal;
end
