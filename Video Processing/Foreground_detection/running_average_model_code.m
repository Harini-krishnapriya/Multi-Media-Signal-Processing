% iterative method for object detection 
% Running Average Model
clc;
clear all;
video = VideoReader('traffic.avi'); 
video_read = read(video);
FrameRate = get(video,'NumberOfFrames'); 
[m,n,p,q] = size(video_read);
diff_frame = uint8(zeros(m,n,p)); 
binary_frame = uint8(zeros(m,n,p));
threshold = input("Enter the Threshold value");
B1(:,:,:,1) = video_read(:,:,:,2)-video_read(:,:,:,1);
B(:,:,:,1) = video_read(:,:,:,1)-B1(:,:,:,1);
alpha=0.6;
for i = 2:FrameRate
    B(:,:,:,i) = alpha*video_read(:,:,:,i-1)+(1-alpha)*B(:,:,:,i-1); % Background
end
for f = 1:FrameRate 
    diff_frame(:,:,:) = abs(video_read(:,:,:,f)-B(:,:,:,f)); % Taking differnce of previous frame and present frame
    for k=1:3
        for i=1:m
            for j=1:n
                if(diff_frame(i,j,k)>threshold)
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