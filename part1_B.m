function [mag, dir] = part1_B(img)

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

mag = uint8(sqrt(double(graX).^2 + double(graY).^2));

graX(abs(graX)<=50) = 0;
graY(abs(graY)<=50) = 0;

dir = zeros(size_img(1),size_img(2));

for i = 1:1080
    for j = 1:1920
        if(graX(i,j)>0 && graY(i,j)>0)
            dir(i,j) = graX(i,j)/graY(i,j);
            dir(i,j) = atan(dir(i,j))*180/pi;
            dir(i,j) = dir(i,j) / 360;
        end
        if(graX(i,j)== 0 && graY(i,j)>0)
            dir(i,j) = 90/360;
        end
        if(graX(i,j)<0 && graY(i,j)>0)
            dir(i,j) = -graX(i,j)/graY(i,j);
            dir(i,j) = 180 - atan(dir(i,j))*180/pi;
            dir(i,j) = dir(i,j) / 360;
        end
        if(graX(i,j)>0 && graY(i,j)==0)
            dir(i,j) = 180/360;
        end
        if(graX(i,j)<0 && graY(i,j)<0)
            dir(i,j) = graX(i,j)/graY(i,j);
            dir(i,j) = 180 + atan(dir(i,j))*180/pi;
            dir(i,j) = dir(i,j) / 360;
        end
        if(graX(i,j)==0 && graY(i,j)<0)
            dir(i,j) = 270/360;
        end
        if(graX(i,j)>0 && graY(i,j)<0)
            dir(i,j) = graX(i,j)/-graY(i,j);
            dir(i,j) = 360 - atan(dir(i,j))*180/pi;
            dir(i,j) = dir(i,j) / 360;
        end
        if(graX(i,j)>0 && graY(i,j)==0)
            dir(i,j) = 0;
        end
        if(graX(i,j)==0 && graY(i,j)==0)
            dir(i,j) = 0;
        end
    end
end

%% Define Color Map
% The hsvMap will mapping value 0 ~ 1 to custom color space
hsvMap = linspace( 0, 1, 99 )' ;
hsvMap(:, 2) = 0.5;
hsvMap(:, 3) = 1;
rgbMap = hsv2rgb(hsvMap);
rgbMap = [ 0.2 0.2 0.2 ; rgbMap ];
%% Show Image

threshold = 0.2;
dir(dir < threshold) = 0;

figure;
imshow(dir,'ColorMap',rgbMap);

% figure(1),
% imshow(graX);
% figure(2),
% imshow(graY);
% figure(3),
% imshow(mag);
% 
% [Gmag,Gdir] = imgradient(img);
end