% non iterative method for object detection 
% Mean Filter
clc;
clear all;
video = VideoReader('traffic.avi'); 
video_read = read(video);
FrameRate = get(video,'NumberOfFrames'); 
[m,n,p,q] = size(video_read);
diff_frame = uint8(zeros(m,n,p)); 
binary_frame = uint8(zeros(m,n,p));
for i=1:FrameRate
    noisy_video(:,:,:,i)=imnoise(video_read(:,:,:,i),'gaussian'); % Adding Noise to each Frame
end
Window_length=input("Enter the Window Length");
I_frame=uint8(zeros(m,n,p));
for i=1:FrameRate-Window_length
    for j=i:Window_length+i-1
        I_frame(:,:,:)=I_frame(:,:,:)+noisy_video(:,:,:,j);
    end
    mean_frame(:,:,:,i)=(1/Window_length).*(I_frame(:,:,:));
    I_frame=uint8(zeros(m,n,p));
end
for f = 1:FrameRate-Window_length 
    diff_frame(:,:,:) = abs(video_read(:,:,:,f)-mean_frame(:,:,:,f)); % Taking differnce of previous frame and present frame
    for k=1:3
        for i=1:m
            for j=1:n
                if(diff_frame(i,j,k)>60)
                    binary_frame(i,j,k)=255;
                else
                    binary_frame(i,j,k)=0;
                end
            end
            
        end
    end
    diff_frame=uint8(zeros(m,n,p));
    output_video(:,:,:,f)=binary_frame(:,:,:);
    binary_frame=uint8(zeros(m,n,p));
end
implay(output_video)