function lbp_img = part2_A(img)

img = double(rgb2gray(img));

size_img = size(img);

lbp_img = img;

for i = 2:size_img(1)-1
    for j = 2:size_img(2)-1
        mat = [128 64 32 16 8 4 2 1];
        num=[img(i-1,j-1) img(i-1,j) img(i-1,j+1) img(i,j+1)  img(i+1,j+1) img(i+1,j) img(i+1,j-1) img(i,j-1)];
        num(num < img(i,j)) = 0;
        num(num >= img(i,j)) = 1;
        lbp_img(i,j) = sum(num .* mat);
    end
end

lbp_img = uint8(lbp_img);

end