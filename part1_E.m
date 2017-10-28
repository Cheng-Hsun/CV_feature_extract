function [rot_NMS_3x3, rot_R_3x3, rot_NMS_5x5, rot_R_5x5, sca_NMS_3x3, sca_R_3x3, sca_NMS_5x5, sca_R_5x5] = part1_E(img)

rot = imrotate(img,30,'loose');
sca = imresize(img, 0.5);

[rot_1, useless] = part1_A(rot);
[rot_gau3_3x3, rot_gau3_R3x3, rot_gau3_5x5, rot_gau3_R5x5] = part1_C(rot_1);
[rot_NMS_3x3, rot_R_3x3] = part1_D(rot, rot_gau3_3x3, rot_gau3_R3x3);
[rot_NMS_5x5, rot_R_5x5] = part1_D(rot, rot_gau3_5x5, rot_gau3_R5x5);

[sca_1, useless] = part1_A(sca);
[sca_gau3_3x3, sca_gau3_R3x3, sca_gau3_5x5, sca_gau3_R5x5] = part1_C(sca_1);
[sca_NMS_3x3, sca_R_3x3] = part1_D(sca, sca_gau3_3x3, sca_gau3_R3x3);
[sca_NMS_5x5, sca_R_5x5] = part1_D(sca, sca_gau3_5x5, sca_gau3_R5x5);

end