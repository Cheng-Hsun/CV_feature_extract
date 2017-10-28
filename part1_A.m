function [gau_1, gau_2] = part1_A(img)

G1 = fspecial('gaussian',[3 3],5);
G2 = fspecial('gaussian',[9 9],5);
gau_1 = uint8(imfilter(double(img),G1,'same'));
gau_2 = uint8(imfilter(double(img),G2,'same'));

end
