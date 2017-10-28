clc;clear;close all;

img = imread('J4Poro.png');

[gau_3, gau_9] = part1_A(img);

[sob_mag_3, sob_dir_3] = part1_B(gau_3);
[sob_mag_9, sob_dir_9] = part1_B(gau_9);

[img_gau3_3x3, gau3_R3x3, img_gau3_5x5, gau3_R5x5] = part1_C(gau_3);
[img_gau9_3x3, gau9_R3x3, img_gau9_5x5, gau9_R5x5] = part1_C(gau_9);

[img_NMS_gau3_3x3, NMS_gau3_3x3] = part1_D(img, img_gau3_3x3, gau3_R3x3);
[img_NMS_gau3_5x5, NMS_gau3_5x5] = part1_D(img, img_gau3_5x5, gau3_R5x5);
[img_NMS_gau9_3x3, NMS_gau9_3x3] = part1_D(img, img_gau9_3x3, gau9_R3x3);
[img_NMS_gau9_5x5, NMS_gau9_5x5] = part1_D(img, img_gau9_5x5, gau9_R5x5);

[rot_3x3, rot_R_3x3, rot_5x5, rot_R_5x5, sca_3x3, sca_R_3x3, sca_5x5, sca_R_5x5] = part1_E(img);

dark_img = rgb2ycbcr(img);
dark_img(:,:,1) = dark_img(:,:,1)*0.2;
dark_img(:,:,2) = dark_img(:,:,2)*0.8;
dark_img = ycbcr2rgb(dark_img);
[compare_img3x3] = part1_F(dark_img, NMS_gau3_3x3, rot_R_3x3, sca_R_3x3);


%%
% imwrite(gau_3,'part1_A1.png');
% imwrite(gau_9,'part1_A2.png');
% 
% imwrite(sob_mag_3,'part1_B_mag3.png');
% imwrite(sob_mag_9,'part1_B_mag9.png');
% 
% imwrite(img_gau3_3x3,'part1_C_gau3win3.png');
% imwrite(img_gau3_5x5,'part1_C_gau3win5.png');
% imwrite(img_gau9_3x3,'part1_C_gau9win3.png');
% imwrite(img_gau9_5x5,'part1_C_gau9win5.png');
% 
% imwrite(img_NMS_gau3_3x3,'part1_D_gau3win3.png');
% imwrite(img_NMS_gau3_5x5,'part1_D_gau3win5.png');
% imwrite(img_NMS_gau9_3x3,'part1_D_gau9win3.png');
% imwrite(img_NMS_gau9_5x5,'part1_D_gau9win5.png');
% 
% imwrite(rot_3x3,'part1_E_rotwin3.png');
% imwrite(rot_5x5,'part1_E_rotwin5.png');
% imwrite(sca_3x3,'part1_E_scawin3.png');
% imwrite(sca_5x5,'part1_E_scawin5.png');
% 
% imwrite(compare_img3x3,'part1_F_compare3x3.png');