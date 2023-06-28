% Non Iterative method for object detection 
% Frame Differencing
clc;
clear all;
video = VideoReader('traffic.avi'); 
video_read = read(video);
FrameRate = get(video,'NumberOfFrames'); 
[m,n,p,q] = size(video_read);
u = 1;v = 1; 
diff_frame = uint8(zeros(m,n,p)); 
binary_frame = uint8(zeros(m,n,p));
threshold = input("Enter the Threshold value");
for f = 2:FrameRate 
    diff_frame(:,:,:) = abs(video_read(:,:,:,f)-video_read(:,:,:,f-1)); % Taking difference of previous frame and present frame
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
    output_video(:,:,:,f-1)=binary_frame(:,:,:);
    binary_frame=uint8(zeros(m,n,p));
end 
