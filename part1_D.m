function [ori_img, M] = part1_D(ori_img, img, R)

ori_img = double(ori_img);
img = double(img);

img_sum = img(:,:,1) + img(:,:,2) + img(:,:,3);
img_sum(img_sum < 255*3) = 0;
img_sum(img_sum ~= 0) = 1;

size_img = size(img);

M = zeros(size_img(1), size_img(2));

for i = 4:size_img(1)-3
    for j = 4:size_img(2)-3
        if(max(max(R(i-3:i+3,j-3:j+3))) == R(i,j))
            M(i,j) = img_sum(i,j);
            yn = 1;
            R_max = R(i,j);
            R(i,j) = 0;
            
            if(max(max(R(i-3:i+3,j-3:j+3))) == R_max)
                yn = 0;
            end
            
            if(yn == 0)
                M(i,j) = 0;
            end
            
            R(i,j) = R_max;
        end
    end
end

img1 = ori_img(:,:,1);
img2 = ori_img(:,:,2);
img3 = ori_img(:,:,3);

img1(M ~= 0) = 255;
img2(M ~= 0) = 255;
img3(M ~= 0) = 255;

ori_img(:,:,1) = img1;
ori_img(:,:,2) = img2;
ori_img(:,:,3) = img3;
ori_img = uint8(ori_img);

ori_img = uint8(ori_img);

end