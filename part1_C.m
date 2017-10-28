function [img3x3, R3x3, img5x5, R5x5] = part1_C(img)
%NotAllow: gradient, corner, extractLBPFeatures 

% sobel = [-1 0 1; -2 0 2;-1 0 1]/8;
sobel = [-1 -4 -6 -4 -1;
         -2 -8 -12 -8 -2;
          0 0 0 0 0;
          2 8 12 8 2;
          1 4 6 4 1];
sob = imfilter(double(rgb2gray(img)),sobel,'same');

img = double(img);

size_img = size(img);

gradient1 = [1 0 -1];
graX = imfilter(sob,gradient1,'same');
gradient2 = [1;0;-1];
graY = imfilter(sob,gradient2,'same');

Ix2 = graX.^2;
Iy2 = graY.^2;
Ixy = graX.*graY;

R3x3 = zeros(size_img(1),size_img(2));
R5x5 = zeros(size_img(1),size_img(2));
for i = 2:size_img(1)-1
    for j = 2:size_img(2)-1
        H=[sum(sum(Ix2(i-1:i+1,j-1:j+1))) sum(sum(Ixy(i-1:i+1,j-1:j+1)));sum(sum(Ixy(i-1:i+1,j-1:j+1))) sum(sum(Iy2(i-1:i+1,j-1:j+1)))];
        R3x3(i,j) = min(eig(H));     
    end
end

for i = 3:size_img(1)-2
    for j = 3:size_img(2)-2
        H=[sum(sum(Ix2(i-2:i+2,j-2:j+2))) sum(sum(Ixy(i-2:i+2,j-2:j+2)));sum(sum(Ixy(i-2:i+2,j-2:j+2))) sum(sum(Iy2(i-2:i+2,j-2:j+2)))];
        R5x5(i,j) = min(eig(H));     
    end
end

M = mean(mean(R3x3));

R3x3(R3x3 < M) = 0;

img1 = img(:,:,1);
img2 = img(:,:,2);
img3 = img(:,:,3);

img1(R3x3 ~= 0) = 255;
img2(R3x3 ~= 0) = 255;
img3(R3x3 ~= 0) = 255;

img3x3(:,:,1) = img1;
img3x3(:,:,2) = img2;
img3x3(:,:,3) = img3;
img3x3 = uint8(img3x3);

M = mean(mean(R5x5));

R5x5(R5x5 < M) = 0;

img1 = img(:,:,1);
img2 = img(:,:,2);
img3 = img(:,:,3);

img1(R5x5 ~= 0) = 255;
img2(R5x5 ~= 0) = 255;
img3(R5x5 ~= 0) = 255;

img5x5(:,:,1) = img1;
img5x5(:,:,2) = img2;
img5x5(:,:,3) = img3;
img5x5 = uint8(img5x5);

end