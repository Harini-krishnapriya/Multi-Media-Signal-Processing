% non iterative method for object detection 
% Median Filter
clc;
clear all;
video = VideoReader('traffic.avi'); 
video_read = read(video);
FrameRate = get(video,'NumberOfFrames'); 
[m,n,p,q] = size(video_read);
I_frame =uint8(zeros(m,n,p));
diff_frame = uint8(zeros(m,n,p)); 
binary_frame = uint8(zeros(m,n,p));
window = input("Enter the window length");
for i=1:FrameRate-window
    for j=i:i+window-1
      I_frame(:,:,:)=I_frame(:,:,:)+video_read(:,:,:,j);
    end
    I_win_frame(:,:,:,i)=(1/window).*I_frame(:,:,:);
end
for k=1:3 
    for i=1:m
        for j=1:n
            for wn=1:q-window
               b=1;
               for f=wn:wn+window
                   t(b)=video_read(i,j,k,f);
                   b=b+1;
               end
               I_win_frame(i,j,k,f)=median(t);
            end
        end
    end
end
for f = 1:FrameRate 
    diff_frame(:,:,:) = abs(video_read(:,:,:,f)-I_win_frame(:,:,:,f)); % Taking differnce of previous frame and present frame
    for k=1:3
        for i=1:m
            for j=1:n
                if(diff_frame(i,j,k)>40)
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
