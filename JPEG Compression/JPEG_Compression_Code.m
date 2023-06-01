% JPEG Compression
clc;
clear all;
close all;
Q = [16 11 10 16 24 40 51 61 ;        % Qunatization_Table
     12 12 14 19 26 28 60 55 ;
     14 13 16 24 40 57 69 56 ;
     14 17 22 29 51 87 80 62 ;
     18 22 37 56 68 109 103 77 ;
     24 35 55 64 81 104 113 92 ;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
Img = imread('dogy.jpg');
ImageSize = 8*prod(size(Img));
img_ycbcr = rgb2ycbcr( Img );
quality_factor = input("enter the quality factor");
if quality_factor >= 50
    scaling_factor = (100-quality_factor)/50;
else
    scaling_factor = (50/quality_factor);
end
if scaling_factor ~=0
    Qx = round(Q*scaling_factor );
end
% Downsample
img_ycbcr(:,:,2) = 2*round(img_ycbcr(:,:,2)/2);
img_ycbcr(:,:,3) = 2*round(img_ycbcr(:,:,3)/2);
% DCT
A = zeros(size(img_ycbcr));
img_idct = A;
for channel = 1:3
    for j = 1:8:size(img_ycbcr,1)-7
        for k = 1:8:size(img_ycbcr,2)-7
            img_block = img_ycbcr(j:j+7,k:k+7,channel); % 8x8 Block
            img_dct = dct2(img_block);
            img_dct = Qx.*round(img_dct./Qx);
            A(j:j+7,k:k+7,channel) = img_dct;
            img_idct(j:j+7,k:k+7,channel) = idct2(img_dct);
        end
    end
end
b = A(:);
b = b(:);
b(b==0)=[];  %remove zeros.
b = floor(255*(b-min(b))/(max(b)-min(b)));
symbols = unique(b);
prob = histcounts(b,length(symbols))/length(b);
dict = huffmandict(symbols, prob);
enco = huffmanenco(b, dict);
FinalCompressedImage = length(enco);
disp('the compression achieved is:');
ImageSize/FinalCompressedImage
subplot(1,2,1)
imshow(Img)
title('Original Image')
subplot(1,2,2)
imshow(ycbcr2rgb(uint8(img_idct)));
title('Compressed Image with quality factor'+ string(quality_factor));