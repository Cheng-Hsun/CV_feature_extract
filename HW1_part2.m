clc;clear;close all;
%inner prodoct; look ILMS, I'm not sure.
img_1 = imread('gasolFace.png');
img_2 = imread('kobeFace.png');

lbp_img_1 = part2_A(img_1);
lbp_img_2 = part2_A(img_2);
lbp_simi_whole = part2_similarity(lbp_img_1,lbp_img_2);

size_img_1 = size(lbp_img_1);
size_img_2 = size(lbp_img_2);

h = [2 3 4 9 20];

lbp_simi = [0 0 0 0 0];
hist_1 = [];
hist_2 = [];

for s = 1:5
    cell = h(s);
    for i = 1:cell
        for j = 1:cell
            wid = size_img_1(1) / cell;
            map_1 = lbp_img_1((i-1)*wid+1:i*wid,(j-1)*wid+1:j*wid);
            map_2 = lbp_img_2((i-1)*wid+1:i*wid,(j-1)*wid+1:j*wid);
            [h1, h2] = part2_similarity(map_1, map_2);
            hist_1 = [hist_1; h1];
            hist_2 = [hist_2; h2];
        end
    end
    hist_1 = normc(hist_1);
    hist_2 = normc(hist_2);
    simi = dot(hist_1, hist_2);
    hist_1 = [];
    hist_2 = [];
    lbp_simi(s) = lbp_simi(s) + simi;           
end

ulbp_img_1 = part2_B(img_1);
ulbp_img_2 = part2_B(img_2);

ulbp_simi_1 = part2_similarity(lbp_img_1,lbp_img_2);
ulbp_simi_2 = part2_similarity(ulbp_img_1,ulbp_img_2);

ulbp_simi_whole = part2_similarity(ulbp_img_1,ulbp_img_2);

ulbp_simi = [0 0 0 0 0];

for s = 1:5
    cell = h(s);
    for i = 1:cell
        for j = 1:cell
            wid = size_img_1(1) / cell;
            map_1 = ulbp_img_1((i-1)*wid+1:i*wid,(j-1)*wid+1:j*wid);
            map_2 = ulbp_img_2((i-1)*wid+1:i*wid,(j-1)*wid+1:j*wid);
            [h1, h2] = part2_similarity(map_1, map_2);
            hist_1 = [hist_1; h1];
            hist_2 = [hist_2; h2];

        end
    end
    hist_1 = normc(hist_1);
    hist_2 = normc(hist_2);
    simi = dot(hist_1, hist_2);
    hist_1 = [];
    hist_2 = [];
    ulbp_simi(s) = ulbp_simi(s) + simi;  
end

% imwrite(lbp_img_1,'part2_B_lbp1.png');
% imwrite(lbp_img_2,'part2_B_lbp2.png');
% imwrite(ulbp_img_1,'part2_B_ulbp1.png');
% imwrite(ulbp_img_2,'part2_B_ulbp2.png');






