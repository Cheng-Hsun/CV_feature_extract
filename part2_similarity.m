function [h1, h2] = part2_similarity(img1,img2)

img1 = double(img1);
img2 = double(img2);

size_img1 = size(img1);
size_img2 = size(img2);

h1 = zeros(256,1);
h2 = zeros(256,1);

for level = 0:255
    h1(level+1) = sum(sum(img1 == level)) / size_img1(1) / size_img1(2);
    h2(level+1) = sum(sum(img2 == level)) / size_img2(1) / size_img2(2);
end

end
