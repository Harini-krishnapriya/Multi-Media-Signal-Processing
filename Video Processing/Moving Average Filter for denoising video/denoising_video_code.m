% De-noising Video Signal
clc;
clear all;
video_read =VideoReader('xylophone.mpg');
video=read(video_read);
[m,n,p,q]=size(video);
no_of_frames=get(video_read,'NumberOfFrames');  
for i=1:no_of_frames
    noisy_video(:,:,:,i)=imnoise(video(:,:,:,i),'gaussian'); % Adding Noise to each Frame
end
Window_length=input("Enter the Window Length");
I_frame=uint8(zeros(m,n,p));
for i=1:no_of_frames-Window_length
    for j=i:Window_length+i-1
        I_frame(:,:,:)=I_frame(:,:,:)+noisy_video(:,:,:,j);
    end
    output_video(:,:,:,i)=(1/Window_length).*(I_frame(:,:,:));
    I_frame=uint8(zeros(m,n,p));
end
implay(output_video)