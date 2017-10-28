function [result] = part1_F(img, ori_R, rot_R, sca_R)

size_img = size(img);
R = zeros(size_img(1),size_img(2));
rot_R = imrotate(rot_R,-30,'loose');
R(2:1079,2:1919) = rot_R(835:1912,472:2389);
rot_R = R;

size_img = size(img);
size_sca = size(sca_R);
R = zeros(size_img(1),size_img(2));
for i = 1:size_sca(1)
    for j = 1:size_sca(2)
        if(sca_R(i,j) == 1)
            R(i*2,j*2) = 1;
        end
    end
end
sca_R = R;

img1 = img(:,:,1);
img2 = img(:,:,2);
img3 = img(:,:,3);

img1(ori_R ~= 0) = 255;
img2(ori_R ~= 0) = 255;
img3(ori_R ~= 0) = 255;

img1(rot_R ~= 0) = 0;
img2(rot_R ~= 0) = 255;
img3(rot_R ~= 0) = 0;

img1(sca_R ~= 0) = 0;
img2(sca_R ~= 0) = 0;
img3(sca_R ~= 0) = 255;

result(:,:,1) = img1;
result(:,:,2) = img2;
result(:,:,3) = img3;
result = uint8(result);

end